{ pkgs
, buildPythonPackage
, fetchPypi
, astroid
, pylint
, protobuf
}:

buildPythonPackage rec {
  pname = "pylint-protobuf";
  version = "0.5";

  doCheck = true;

  src = fetchPypi {
    inherit pname version;
    sha256 = "594464621b24e2fe0b9745d4303778705ef6e1d22189d6cd024cc0f740414c70";
  };

  propagatedBuildInputs = [
      astroid
      pylint
      protobuf
  ];

  meta = with pkgs.lib; {
    homepage = "https://github.com/nelfin/pylint-protobuf";
    license = licenses.mit;
    description = "A plugin for making Pylint aware of the fields of protobuf-generated classes";
    maintainers = [ maintainers.swarren ];
  };
}
