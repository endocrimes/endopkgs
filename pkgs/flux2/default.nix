{ stdenv, buildGoModule, fetchFromGitHub, installShellFiles }:

buildGoModule rec {
  pname = "flux2";
  version = "0.5.7";

  src = fetchFromGitHub {
    owner = "fluxcd";
    repo = pname;
    rev = "v${version}";
    sha256 = "1xs09wamvkl8i90s73ndsni2d89s3x4xxxdmvyjxqgaqnn5bdqva";
  };

  vendorSha256 = "1r5n65qd129ms8f2zjwy0fiky4c1wl3mz0dnmyzzy8w5i9sacm9g";

  nativeBuildInputs = [ installShellFiles ];

  doCheck = false;

  subPackages = [ "cmd/flux" ];

  buildFlagsArray = [ "-ldflags=-s -w -X main.VERSION=${version}" ];

  postInstall = ''
    for shell in bash fish zsh; do
      $out/bin/flux completion $shell > flux.$shell
      installShellCompletion flux.$shell
    done
  '';

  meta = with stdenv.lib; {
    description = "CLI client for Flux, the GitOps Kubernetes operator";
    homepage = "https://github.com/fluxcd/flux2";
    license = licenses.asl20;
    maintainers = with maintainers; [ endocrimes ];
  };
}
