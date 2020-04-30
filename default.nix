{ system ? builtins.currentSystem }:

let
   pkgs = import <nixpkgs> { inherit system; };

   callPackage = pkgs.lib.callPackageWith (pkgs // self);

   self = {
      keylightctl = callPackage ./pkgs/keylightctl { };
   };
   in self
