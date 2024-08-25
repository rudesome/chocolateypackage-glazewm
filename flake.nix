{
  description = "Chocolatey package of GlazeWM";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { system = "x86_64-linux"; };
    in
    {

      devShells.${system}.default =
        with pkgs;
        mkShell
          {
            buildInputs = with pkgs; [
              powershell
            ];
          };

    };
}
