{ stdenv, buildGoPackage, fetchFromGitHub }:

buildGoPackage rec {
  name = "hclfmt-unstable-${version}";
  version = "2019-07-20";
  goPackagePath = "github.com/fatih/hclfmt";

  src = fetchFromGitHub {
    owner = "endocrimes"; # Use personal fork
    repo = "hclfmt";
    rev = "1fa3d0fbf4712a47a527c10e397118ed5e7cd7a7";
    sha256 = "1sv7040ccjcmcy2203hc6ibq608dnn8jkz9a5d236wc6jz4ymhn0";
  };

  goDeps = ./deps.nix;

  meta = with stdenv.lib; {
    description = "A formatter for the HashiCorp Configuration Language.";
    license = licenses.bsd3;
    maintainers = with maintainers; [ endocrimes ];
  };
}
