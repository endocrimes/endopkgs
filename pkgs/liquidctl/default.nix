{ python3, python3Packages, lib, libusb1 }:


let
  inherit (python3.pkgs) buildPythonApplication fetchPypi;
in
buildPythonApplication rec {
  pname = "liquidctl";
  version = "1.4.2";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0g0sdzknii70d2rc1pasb0d6qfzhyhcxp3z788gdkjz1r9dmznir";
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

