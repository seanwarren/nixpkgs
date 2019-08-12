{ buildPythonPackage
, fetchPypi
, dateutil
, jmespath
, docutils
, ordereddict
, simplejson
, mock
, nose
, urllib3
}:

buildPythonPackage rec {
  pname = "botocore";
  version = "1.12.201"; # N.B: if you change this, change boto3 and awscli to a matching version

  src = fetchPypi {
    inherit pname version;
    sha256 = "1fp7f58bjidj1qkzcp0xkh1xrfjxyhi9vad340l149wss2vxxlci";
  };

  propagatedBuildInputs = [
    dateutil
    jmespath
    docutils
    ordereddict
    simplejson
    urllib3
  ];

  checkInputs = [ mock nose ];

  checkPhase = ''
    nosetests -v
  '';

  # Network access
  doCheck = false;

  meta = {
    homepage = https://github.com/boto/botocore;
    license = "bsd";
    description = "A low-level interface to a growing number of Amazon Web Services";
  };
}
