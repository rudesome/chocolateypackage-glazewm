{
  description = "Chocolatey package of GlazeWM";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
  };

  outputs = { self, home-manager, nixpkgs, flake-parts }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {

      systems = [
        "x86_64-linux"
        "aarch64-darwin"
      ];

      perSystem = { system, pkgs, inputs, ... }:
        let
          inherit (pkgs)
            trunk rustup fetchFromGitHub lib alejandra rustPlatform pkg-config glib gtk3;
          inherit (rustPlatform)
            buildRustPackage cargoCheckHook;
          pname = "glazewm";
          version = "v3.1.1";
        in
        {
          packages.default = buildRustPackage rec {
            inherit pname version;

            src = fetchFromGitHub {
              owner = "glzr-io";
              repo = pname;
              rev = version;
              hash = "sha256-gSbMnb/mW+0+p+NPvnfV72xzJWzz9ziyj4DF1bjivVo=";
            };
            cargoHash = "sha256-WbPWPA0dNt5hOvVxQ7l7SAFk5Quo8LiGxkozdBfoqzU=";

            nativeBuildInputs = [ pkg-config ];

            buildInputs = [
              glib
              gtk3
              trunk
              rustup
            ];

            nativeCheckInputs = [
              cargoCheckHook
            ];

            buildPhase = ''
              echo "<<<<<<||BUILDPHASE||>>>>>>>"
            '';

            separateDebugInfo = false;

            doCheck = true;

            #postPatch = ''
            #substituteInPlace $out/packages/wm/ --subst-var-by path = src\\lib.rs '${out}\packages\\lib.rs'
            #'';

            #cargoLock = {
            #lockFile = "${src}/Cargo.lock";
            #allowBuiltinFetchGit = false;
            #};

            meta = with lib; {
              description = "GlazeWM is a tiling window manager for Windows inspired by i3wm.";
              homepage = "https://github.com/glzr-io/glazewm";
              license = licenses.unlicense;
              maintainers = [ ];
            };
          };

          # direnv
          devShells.default =
            with pkgs;
            mkShell {
              buildInputs = with pkgs; [
                powershell
                rust-analyzer
                rustfmt
                clipp
              ];
            };
          formatter = alejandra;
        };

    };
}
