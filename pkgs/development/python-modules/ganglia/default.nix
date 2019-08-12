{ pkgs
, buildPythonPackage
, fetchPypi
}:

buildPythonPackage rec {
  pname = "ganglia";
  version = "0.3.0";

  doCheck = true;

  src = fetchPypi {
    inherit pname version;
    sha256 = "fd50880bce04e44c05af1fd51b0afccf5ed5bffff21c4c56cd2627b8f4f657e9";
  };

  propagatedBuildInputs = [ ];

  meta = with pkgs.lib; {
    homepage = "UNKNOWN";
    license = licenses.mit;
    description = "A Ganglia client";
    maintainers = [ maintainers.swarren ];
  };
}
