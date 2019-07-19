{stdenv, fetchurl, cmake}:

let
  version = "3.3.8";
in
stdenv.mkDerivation {
  name = "eigen-${version}";

  src = fetchurl {
    url = "https://bitbucket.org/eigen/eigen/get/7577527c33a6c4df8a321ea50378285cae83c3dd.tar.gz";
    name = "eigen-eigen-7577527c33a6.tar.gz";
    sha256 = "1x4hj4wmn6mnphwkw7w6ylrfzcxmmrwiznhij10p6xwsdc6g6azk";
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
