{ pkgs
, buildPythonPackage
, fetchPypi
}:

buildPythonPackage rec {
  pname = "astrolabe";
  version = "0.4.0";

  doCheck = true;

  src = fetchPypi {
    inherit pname version;
    sha256 = "67e0e8bf1a7d8c3d035223579162701f7e135701c44d06d5d6b6fa656ae46e16";
  };

  propagatedBuildInputs = [ ];

  meta = with pkgs.lib; {
    homepage = "https://github.com/cyberdelia/astrolabe";
    license = "";
    description = "Timer library for recording performance metrics.";
    maintainers = [ maintainers.swarren ];
  };
}
