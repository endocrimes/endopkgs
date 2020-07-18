{ stdenv, fetchFromGitHub, buildGoModule }:

buildGoModule rec {
  name = "keylightctl-${version}";
  version = "0.0.1";

  src = fetchFromGitHub {
    owner = "endocrimes";
    repo = "keylightctl";
    rev = "${version}";
    sha256 = "1xkw04fsyn1hrpmmkw23cj77s4qnw8x4mhvzi55hjnzifq71h4p1";
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
