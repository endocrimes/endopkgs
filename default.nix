{ system ? builtins.currentSystem }:

let
   pkgs = import <nixpkgs> { inherit system; };

   callPackage = pkgs.lib.callPackageWith (pkgs // self);

   self = {
      keylightctl = callPackage ./pkgs/keylightctl { };
      liquidctl = callPackage ./pkgs/liquidctl { };
      deckmaster = callPackage ./pkgs/deckmaster { };
      rmapi = callPackage ./pkgs/rmapi { };
      flux2 = callPackage ./pkgs/flux2 { };
   };
   in self
