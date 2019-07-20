{ system ? builtins.currentSystem }:

let
   pkgs = import <nixpkgs> { inherit system; };

   callPackage = pkgs.lib.callPackageWith (pkgs // self);

   self = {
      hclfmt = callPackage ./pkgs/hclfmt { };
   };
   in self
