{ pkgs
, buildPythonPackage
, fetchPypi
, cffi
}:

buildPythonPackage rec {
  pname = "atomic";
  version = "0.7.3";

  doCheck = false;

  src = fetchPypi {
    inherit pname version;
    sha256 = "e23baa42ace8d69693f7a9be83377f410be301c29cb3121b070fa9b9473b2e5c";
  };

  propagatedBuildInputs = [
      cffi
  ];

  meta = with pkgs.lib; {
    homepage = "https://github.com/cyberdelia/atomic";
    license = licenses.mit;
    description = "An atomic class that guarantees atomic updates to its contained value.";
    maintainers = [ maintainers.swarren ];
  };
}
