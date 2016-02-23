{ mkDerivation, aeson, base, boomerang, safecopy, stdenv, web-routes-th }:
mkDerivation {
  pname = "userid";
  version = "0.1.2.5";
  src = ./.;
  buildDepends = [ aeson base boomerang safecopy web-routes-th ];
  homepage = "http://www.github.com/Happstack/userid";
  description = "A library which provides the UserId type";
  license = stdenv.lib.licenses.bsd3;
}
