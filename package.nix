{ mkDerivation, base, bytestring, Cabal, conduit, conduit-extra
, directory, exceptions, filepath, ghc, haddock-api, http-types
, lib, mtl, optparse-applicative, process, resourcet, sqlite-simple
, tagsoup, text, transformers
}:
mkDerivation {
  pname = "haddocset";
  version = "0.4.3";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base bytestring Cabal conduit conduit-extra directory exceptions
    filepath ghc haddock-api http-types mtl optparse-applicative
    process resourcet sqlite-simple tagsoup text transformers
  ];
  homepage = "https://github.com/philopon/haddocset";
  description = "Generate docset of Dash by Haddock haskell documentation tool";
  license = lib.licenses.bsd3;
}
