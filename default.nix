{ mkDerivation, aeson, base, boomerang, lens, safecopy, stdenv, web-routes-th }:
mkDerivation {
  pname = "userid";
  version = "0.1.0.0";
  src = ./.;
  buildDepends = [ aeson base boomerang lens safecopy web-routes-th ];
  homepage = "http://www.github.com/Happstack/userid";
  description = "A library which provides the UserId type";
  license = stdenv.lib.licenses.bsd3;
}
