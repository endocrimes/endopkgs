{ stdenv, fetchFromGitHub, buildGoModule, makeWrapper, roboto }:

buildGoModule rec {
  name = "deckmaster-unstable-${version}";
  version = "2020-11-09";

  src = fetchFromGitHub {
    owner = "endocrimes";
    repo = "deckmaster";
    rev = "8f2bfdee4da7c5995a1f758ef326ee7221cefd5f";
    sha256 = "1921vzavfmhi1y37gii64dq7ai22clzh5fcdkf6lngl49ffwkxb5";
  };

  vendorSha256 = "0q9cxzmnpm06gix7vydk1xwqwlamqg15i4qq14n8rrg8zkv6bfqk";
  runVend = true;

  nativeBuildInputs = [ makeWrapper ];

  postInstall = ''
    wrapProgram $out/bin/deckmaster --prefix XDG_DATA_DIRS : "${roboto.outPath}/share"
  '';

  meta = with stdenv.lib; {
    homepage = "https://github.com/muesli/deckmaster";
    description = "A tool for using a Stream Deck on Linux.";
    platforms = platforms.linux;
    license = licenses.mit;
    maintainers = with maintainers; [ endocrimes ];
  };
}
