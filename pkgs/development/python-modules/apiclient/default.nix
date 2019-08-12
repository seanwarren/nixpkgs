{ pkgs
, buildPythonPackage
, fetchPypi
, certifi
, urllib3
}:

buildPythonPackage rec {
  pname = "apiclient";
  version = "1.0.4";

  doCheck = false; # requires nose for tests

  src = fetchPypi {
    inherit pname version;
    sha256 = "2569c998191cd1a042beffa3cf7c1119277237b4ba1fa021d20c81fa98fa95e9";
  };

  propagatedBuildInputs = [
      certifi
      urllib3
  ];

  meta = with pkgs.lib; {
    homepage = "https://geographiclib.sourceforge.io/1.49/python";
    license = licenses.mit;
    description = "The geodesic routines from GeographicLib";
    maintainers = [ maintainers.swarren ];
  };
}
