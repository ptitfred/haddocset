{
  description = "haddocset";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = { nixpkgs, flake-utils, ... }:
    let overlay = (self: super: {
          haskellPackages = super.haskellPackages // {
            haddock-api = self.haskell.lib.doJailbreak super.haskellPackages.haddock-api;
            haddocset   = super.haskellPackages.callCabal2nix "haddocset" ./. { inherit (self.haskellPackages) haddock-api; };
          };

          haddocset = self.haskellPackages.haddocset;
        });

        overlays = [overlay];

        globals = {
          overlays.default = overlay;
        };

        forSystem = system:
          let pkgs = import nixpkgs { inherit system overlays; config.allowBroken = true; };
           in {
                packages.default = pkgs.haddocset;
              };
     in globals // flake-utils.lib.eachDefaultSystem forSystem;
}
