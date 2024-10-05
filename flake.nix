{
  description = "A simple C project using just";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages = rec {
          simple-project = pkgs.stdenv.mkDerivation {
            pname = "simple-project";
            version = "0.1.0";
            src = ./.;

            nativeBuildInputs = [ pkgs.just pkgs.gcc ];

            # The just hook will automatically use the appropriate just commands
            # for each phase, so we don't need to specify them explicitly

            meta = with pkgs.lib; {
              description = "A simple project using just";
              homepage = "https://github.com/samrose/nix-justhook";
              license = licenses.mit;
              maintainers = with maintainers; [ ];
            };
          };

          default = simple-project;
        };

        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            gcc
            just
          ];
        };
      }
    );
}