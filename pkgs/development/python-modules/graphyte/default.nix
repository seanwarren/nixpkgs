{ pkgs
, buildPythonPackage
, fetchPypi
}:

buildPythonPackage rec {
  pname = "graphyte";
  version = "1.6.0";

  doCheck = true;

  src = fetchPypi {
    inherit pname version;
    sha256 = "ab1fd5a0061cd8f412d379273e36dfb4b80906c4c804052cfe3aa1ed416dc072";
  };

  propagatedBuildInputs = [ ];

  meta = with pkgs.lib; {
    description = "Python 3 compatible library to send data to a Graphite metrics server (Carbon)";
    homepage = "https://github.com/Jetsetter/graphyte";
    license = licenses.mit;
    maintainers = [ maintainers.swarren ];
  };
}
