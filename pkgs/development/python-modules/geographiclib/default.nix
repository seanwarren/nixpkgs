{ pkgs
, buildPythonPackage
, fetchPypi
}:

buildPythonPackage rec {
  pname = "geographiclib";
  version = "1.49";

  doCheck = true;

  src = fetchPypi {
    inherit pname version;
    sha256 = "635da648fce80a57b81b28875d103dacf7deb12a3f5f7387ba7d39c51e096533";
  };

  propagatedBuildInputs = [ ];

  meta = with pkgs.lib; {
    homepage = "https://geographiclib.sourceforge.io/1.49/python";
    license = licenses.mit;
    description = "The geodesic routines from GeographicLib";
    maintainers = [ maintainers.swarren ];
  };
}
