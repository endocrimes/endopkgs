{ stdenv, fetchFromGitHub, buildGoModule }:

buildGoModule rec {
  name = "gotestsum-${version}";
  version = "0.3.5";

  src = fetchFromGitHub {
    owner = "gotestyourself";
    repo = "gotestsum";
    rev = "v${version}";
    sha256 = "1d4sbvk9wqzl3g3da8inqdkvd43rkwvmq969jlgl1k1agv5xjxqv";
  };

  modSha256 = "1q1rx3m25zw1xx3srfpaqmazgw987hdkpd9lhxcg2fg5qfz97psd";

  meta = with stdenv.lib; {
    homepage = https://github.com/gotestyourself/gotestsum;
    description = "A human friendly `go test` runner";
    platforms = platforms.linux ++ platforms.darwin;
    license = licenses.apache2;
    maintainers = with maintainers; [ endocrimes ];
  };
}
