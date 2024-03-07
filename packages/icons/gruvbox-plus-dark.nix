{ lib
, stdenvNoCC
, fetchFromGitHub
, gnome-themes-extra
, gtk-engine-murrine
}:
stdenvNoCC.mkDerivation rec {
  name = "Gruvbox Plus Dark";
  pname = "Gruvbox Plus Dark";
  # version = "master";

  src = fetchFromGitHub {
    owner = "SylEleuth";
    repo = "gruvbox-plus-icon-pack";
    rev = "d663023f66e195ef63efac1fdab089336dc56984";
    sha256 = "0rbr6xscpn9c5b7vjjyk4cjzffqgrn1s0pf6xsh2ig7ns63mpas7";
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/icons/"Gruvbox Plus Dark"
    cp -a Gruvbox-Plus-Dark/* $out/share/icons/"Gruvbox Plus Dark"
    runHook postInstall
  '';

  # meta = with lib; {
  #   description = "A Gtk theme based on the Gruvbox colour pallete";
  #   homepage = "https://www.pling.com/p/1681313/";
  #   license = licenses.gpl3Only;
  #   platforms = platforms.unix;
  #   maintainers = [ maintainers.math-42 ];
  # };
}
