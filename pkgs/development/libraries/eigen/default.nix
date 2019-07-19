{stdenv, fetchurl, cmake}:

let
  version = "3.3.8";
in
stdenv.mkDerivation {
  name = "eigen-${version}";

  src = fetchurl {
    url = "https://bitbucket.org/eigen/eigen/get/7577527c33a6c4df8a321ea50378285cae83c3dd.tar.gz";
    name = "eigen-eigen-7577527c33a6.tar.gz";
    sha256 = "1f7a5zvcx5iway1gp9s3qk1yb3jrkam2lr1cqwd3jq3s3lldsp7p";
  };

  patches = [
    ./include-dir.patch
  ];

  nativeBuildInputs = [ cmake ];

  meta = with stdenv.lib; {
    description = "C++ template library for linear algebra: vectors, matrices, and related algorithms";
    license = licenses.lgpl3Plus;
    homepage = http://eigen.tuxfamily.org ;
    platforms = platforms.unix;
    maintainers = with stdenv.lib.maintainers; [ sander raskin ];
    inherit version;
  };
}
