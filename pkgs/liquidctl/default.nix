{ python3, python3Packages, lib, libusb1 }:


let
  inherit (python3.pkgs) buildPythonApplication fetchPypi;
in
buildPythonApplication rec {
  pname = "liquidctl";
  version = "1.4.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "13gzfanxdrn45cwz9mm1j7jxxpwmdvz02i122ibimrzkndjvr8sr";
  };

  propagatedBuildInputs =
    with python3Packages; [
      pyusb
      setuptools
      docopt
      hidapi
    ] ++ [
      libusb1
    ];

  makeWrapperArgs = [
    "--prefix" "LD_LIBRARY_PATH" ":"
    (lib.makeLibraryPath [ libusb1 ])
  ];

  doCheck = false;
}

