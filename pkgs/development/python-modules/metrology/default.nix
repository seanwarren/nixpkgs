{ pkgs
, buildPythonPackage
, fetchPypi
, astrolabe
, atomic
, ganglia
, requests
, pbr
}:

buildPythonPackage rec {
  pname = "metrology";
  version = "1.2.4";

  doCheck = false; # requires many other packages

  src = fetchPypi {
    inherit pname version;
    sha256 = "8f591a59c961ae3536c7e7a04911cc7075ad169afd3a3963f60c55c11ae059ac";
  };

  propagatedBuildInputs = [ 
    astrolabe
    atomic
    ganglia
    requests
    pbr
  ];

  meta = with pkgs.lib; {
        homepage = "https://github.com/cyberdelia/metrology";
        license = licenses.mit;
        description = "A library to easily measure what\'s going on in your python.";
    maintainers = [ maintainers.swarren ];
  };
}
