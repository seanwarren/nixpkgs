{ stdenv, fetchPypi, buildPythonPackage }:

buildPythonPackage rec {
  pname = "colorama";
  version = "0.3.8";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1jdckb4yvbxigyr4mwaq46d617frl41r358yfs83h6db385lgh36";
  };

  # No tests in archive
  doCheck = false;

  meta = with stdenv.lib; {
    homepage = https://github.com/tartley/colorama;
    license = licenses.bsd3;
    description = "Cross-platform colored terminal text";
  };
}

