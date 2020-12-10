{ stdenv, fetchFromGitHub, buildGoModule }:

buildGoModule rec {
  name = "rmapi-${version}";
  version = "0.0.13";

  src = fetchFromGitHub {
    owner = "juruen";
    repo = "rmapi";
    rev = "v${version}";
    sha256 = "0qq8x37p7yxhcp5d5xss3pv5186xgg0hd6lbkqivhy5yjsd54c7b";
  };

  vendorSha256 = "1pa75rjns1kknl2gmfprdzc3f2z8dk44jkz6dmf8f3prj0z7x88c";

  meta = with stdenv.lib; {
    homepage = "https://github.com/jueren/rmapi";
    description = "Go app that allows you to access your reMarkable tablet files through the Cloud API";
    platforms = platforms.linux ++ platforms.darwin;
    license = licenses.agpl3;
    maintainers = with maintainers; [ endocrimes ];
  };
}
