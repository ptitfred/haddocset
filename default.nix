{ pkgs ? import <nixpkgs> {}
}:

let hp = pkgs.haskellPackages;
    hspec-core     = hp.callPackage nix/hspec-core-2.7.10.nix     {};
    hspec-discover = hp.callPackage nix/hspec-discover-2.7.10.nix {};
    hspec          = hp.callPackage nix/hspec-2.7.10.nix          { inherit hspec-core hspec-discover; };
    haddock-api    = hp.callPackage nix/haddock-api-2.25.1.nix    { inherit hspec hspec-discover;      };
    haddocset      = hp.callPackage ./package.nix                 { inherit haddock-api;               };
 in haddocset
