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
          inherit (pkgs) fetchFromGitHub lib alejandra rustPlatform;
          inherit (rustPlatform) buildRustPackage;
          pname = "glazewm";
          version = "v3.1.1";
        in
        {
          packages.default = buildRustPackage {
            inherit pname version;

            src = fetchFromGitHub {
              owner = "glzr-io";
              repo = pname;
              rev = version;
              hash = "sha256-gSbMnb/mW+0+p+NPvnfV72xzJWzz9ziyj4DF1bjivVo=";
            };

            cargoHash = "sha256-WbPWPA0dNt5hOvVxQ7l7SAFk5Quo8LiGxkozdBfoqzU=";

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
              ];
            };
          formatter = alejandra;
        };

    };
}
