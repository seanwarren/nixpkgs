{ pkgs
, buildPythonPackage
, fetchPypi
, botocore
, colorama
, docutils
, pyyaml
, rsa
, s3transfer
}:

buildPythonPackage rec {
  pname = "awscli";
  version = "1.16.211";

  doCheck = true;

  src = fetchPypi {
    inherit pname version;
    sha256 = "900501bfe97fbb7cb5de573da8dd2d965befa620a946dc5f7104658834a4475f";
  };

  propagatedBuildInputs = [ 
    botocore
    colorama
    docutils
    pyyaml
    rsa
    s3transfer
  ];

  meta = with pkgs.lib; {
    homepage = "http://aws.amazon.com/cli/";
    license = licenses.asl20;
    description = "Universal Command Line Environment for AWS.";
    maintainers = [ maintainers.swarren ];
  };
}
