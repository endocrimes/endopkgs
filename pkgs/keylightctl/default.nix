{ stdenv, fetchFromGitHub, buildGoModule }:

buildGoModule rec {
  name = "keylightctl-${version}";
  version = "0.0.3";

  src = fetchFromGitHub {
    owner = "endocrimes";
    repo = "keylightctl";
    rev = "${version}";
    sha256 = "0299sgxlsvqyxplflplbd11m0c8xwgcsnnsyqmp7nzc5a5f0y03p";
  };

  vendorSha256 = null;

  meta = with stdenv.lib; {
    homepage = "https://github.com/endocrimes/keylightctl";
    description = "A tool for controlling elgato key lights.";
    platforms = platforms.linux ++ platforms.darwin;
    license = licenses.gpl3;
    maintainers = with maintainers; [ endocrimes ];
  };
}
