{ stdenv, fetchurl, unzip }:

stdenv.mkDerivation {
  name = "httpunit-1.7";

  src = fetchurl {
    url = mirror://sourceforge/httpunit/httpunit-1.7.zip;
    sha256 = "09gnayqgizd8cjqayvdpkxrc69ipyxawc96aznfrgdhdiwv8l5zf";
  };

  nativeBuildInputs = [ unzip ];

  installPhase = ''
    mkdir $out
    cp -rv * $out/
  '';

  meta = with stdenv.lib; {
    homepage = http://httpunit.sourceforge.net;
    platforms = platforms.unix;
    license = licenses.mit;
  };
}
