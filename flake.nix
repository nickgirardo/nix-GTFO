{
  description = "GameTank Flashing, Overhauled";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-24.05";
  };

  outputs = { self, nixpkgs }: {
    packages.x86_64-linux.default =
      let
        system = "x86_64-linux";
        pkgs = import nixpkgs { inherit system; };
      in pkgs.gccStdenv.mkDerivation {
        name = "GTFO";
        homepage = "https://github.com/clydeshaffer/GTFO";

        src = pkgs.fetchgit {
          url = "https://github.com/nickgirardo/GTFO.git";
          rev = "14a148ba9c2ed0c10719283592136012bae703e3";
          sha256 = "sha256-JzKKTtvS2amtvN+0XNBcVNQk5DbHLcRwmESFe2yCYAI=";
          fetchSubmodules = true;
        };

        installPhase = ''
          mkdir -p $out/bin
          cp -r bin $out
        '';
      };
    };
}
