{ pkgs
, buildPythonPackage
, fetchPypi
}:

buildPythonPackage rec {
  pname = "asyncio-nats-client";
  version = "0.9.2";

  doCheck = true;

  src = fetchPypi {
    inherit pname version;
    sha256 = "c36e464a33e2d1bb59437b68ad74051f9f3113969108e4f8008b1e3fb5a2969f";
  };

  propagatedBuildInputs = [ ];

  meta = with pkgs.lib; {
    homepage = "https://github.com/nats-io/nats.py";
    license = "Apache 2 License";
    description = "NATS client for Python Asyncio";
    maintainers = [ maintainers.swarren ];
  };
}
