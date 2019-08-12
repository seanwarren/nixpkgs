{ pkgs
, buildPythonPackage
, fetchPypi
, future
}:

buildPythonPackage rec {
  pname = "s2sphere";
  version = "0.2.5";

  doCheck = true;

  src = fetchPypi {
    inherit pname version;
    sha256 = "c2478c1ff7c601a59a7151a57b605435897514578fa6bdb8730721c182adbbaf";
  };

  propagatedBuildInputs = [ future ];

  meta = with pkgs.lib; {
    homepage = "http://s2sphere.readthedocs.io";
    license = licenses.mit;
    description = "Python implementation of the S2 Geometry Library";
    maintainers = [ maintainers.swarren ];
  };
}
