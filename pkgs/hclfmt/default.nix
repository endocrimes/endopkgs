{ stdenv, buildGoPackage, fetchFromGitHub }:

buildGoPackage rec {
  name = "hclfmt-${version}";
  version = "0.1.0";
  goPackagePath = "github.com/fatih/hclfmt";

  src = fetchFromGitHub {
    owner = "fatih";
    repo = "hclfmt";
    rev = "374cd0fd2a551b57d2538b8f48d63e54fb86468b";
    sha256 = "0i0r6hdp95x1dakm37p3djd60xz1zbz71zq419w66465pd8k5vxw";
  };

  goDeps = ./deps.nix;

  meta = with stdenv.lib; {
    description = "A formatter for the HashiCorp Configuration Language.";
    license = licenses.bsd3;
    maintainers = with maintainers; [ endocrimes ];
  };
}
