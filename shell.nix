{ pkgs ? import <nixpkgs> { } }:
let
  overrides = (builtins.fromTOML (builtins.readFile ./rust-toolchain.toml));
  libPath = with pkgs; lib.makeLibraryPath [
    # load external libraries that you need in your rust project here
  ];
  # Our windows cross package set.
  pkgs-cross-mingw = import pkgs.path {
    crossSystem = {
      config = "x86_64-w64-mingw32";
    };
  };

  #rustupToolchain = "nightly-2021-10-06";
  rustBuildTargetTriple = "x86_64-pc-windows-gnu";
  #rustBuildHostTriple = "x86_64-unknown-linux-gnu";

  # Our windows cross compiler plus
  # the required libraries and headers.
  mingw_w64_cc = pkgs-cross-mingw.stdenv.cc;
  mingw_w64 = pkgs-cross-mingw.windows.mingw_w64;
  mingw_w64_pthreads_w_static = pkgs-cross-mingw.windows.mingw_w64_pthreads.overrideAttrs (oldAttrs: {
    # TODO: Remove once / if changed successfully upstreamed.
    configureFlags = (oldAttrs.configureFlags or [ ]) ++ [
      # Rustc require 'libpthread.a' when targeting 'x86_64-pc-windows-gnu'.
      # Enabling this makes it work out of the box instead of failing.
      "--enable-static"
    ];
  });

  wine = pkgs.wineWowPackages.stable;
in
pkgs.mkShell rec {
  buildInputs = with pkgs; [
    clang
    # Replace llvmPackages with llvmPackages_X, where X is the latest LLVM version (at the time of writing, 16)
    llvmPackages_16.bintools
    rustup
    pkg-config
    glib
    gtk3
    trunk
    mingw_w64_cc
  ];

  RUSTC_VERSION = overrides.toolchain.channel;

  # https://github.com/rust-lang/rust-bindgen#environment-variables
  # Set windows as the default cargo target so that we don't
  # have use the `--target` argument on every `cargo` invocation.
  CARGO_BUILD_TARGET = rustBuildTargetTriple;
  # Set wine as our cargo runner to allow the `run` and `test`
  # command to work.
  CARGO_TARGET_X86_64_PC_WINDOWS_GNU_RUNNER = "${wine}/bin/wine64";

  LIBCLANG_PATH = pkgs.lib.makeLibraryPath [ pkgs.llvmPackages_latest.libclang.lib ];
  shellHook = ''
    export PATH=$PATH:''${CARGO_HOME:-~/.cargo}/bin
    export PATH=$PATH:''${RUSTUP_HOME:-~/.rustup}/toolchains/$RUSTC_VERSION-x86_64-unknown-linux-gnu/bin/

    # Ensures our windows target is added via rustup.
    rustup target add "${rustBuildTargetTriple}"
  '';

  # Add precompiled library to rustc search path
  RUSTFLAGS = (builtins.map (a: ''-L ${a}/lib'') [
    # add libraries here (e.g. pkgs.libvmi)
    pkgs.pkgsCross.mingwW64.windows.pthreads
  ]);
  LD_LIBRARY_PATH = libPath;
  # Add glibc, clang, glib, and other headers to bindgen search path
  BINDGEN_EXTRA_CLANG_ARGS =
    # Includes normal include path
    (builtins.map (a: ''-I"${a}/include"'') [
      # add dev libraries here (e.g. pkgs.libvmi.dev)
      pkgs.glibc.dev
      mingw_w64
      mingw_w64_pthreads_w_static
    ])
    # Includes with special directory paths
    ++ [
      ''-I"${pkgs.llvmPackages_latest.libclang.lib}/lib/clang/${pkgs.llvmPackages_latest.libclang.version}/include"''
      ''-I"${pkgs.glib.dev}/include/glib-2.0"''
      ''-I"${pkgs.glib.out}/lib/glib-2.0/include/"''
    ];
}
