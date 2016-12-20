stdenv.mkDerivation rec {
    name = "st-jpdoyle";

    src = fetchgit {
        url = "https://github.com/jpdoyle/st.git";
        rev = "87a1c96affd9a8cb4551cb1f9ccc5c3f71ed0e56";
        sha256 = "174zi9zmibdvjq6hmn6xiicjj6921vxf44qi6n2ar1ybzq32vzxk";
    };

    configFile = stdenv.lib.optionalString (conf!=null) (writeText "config.def.h" conf);
    preBuild = stdenv.lib.optionalString (conf!=null) "cp ${configFile} config.def.h";

    buildInputs = with pkgs;
    [ pkgconfig xorg.libX11 ncurses xorg.libXext xorg.libXft fontconfig ];

    installPhase = ''
        TERMINFO=$out/share/terminfo make install PREFIX=$out
        '';

    meta = {
        homepage = http://st.suckless.org/;
        license = stdenv.lib.licenses.mit;
    };

    conf = builtins.readFile ./config.h;
}
