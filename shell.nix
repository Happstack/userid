{ nixpkgs ? import <nixpkgs> {}, compiler ? "default" }:

let

  inherit (nixpkgs) pkgs;

  f = { mkDerivation, aeson, base, boomerang, safecopy
      , stdenv, web-routes, web-routes-th, cabal-install
      }:
      mkDerivation {
        pname = "userid";
        version = "0.1.2.5";
        src = ./.;
        libraryHaskellDepends = [
          aeson base boomerang safecopy web-routes web-routes-th
        ];
        homepage = "http://www.github.com/Happstack/userid";
        description = "The UserId type and useful instances for web development";
        license = stdenv.lib.licenses.bsd3;
        buildTools = [ cabal-install ];
      };

  haskellPackages = if compiler == "default"
                       then pkgs.haskellPackages
                       else pkgs.haskell.packages.${compiler};

  drv = haskellPackages.callPackage f {};

in

  if pkgs.lib.inNixShell then drv.env else drv
