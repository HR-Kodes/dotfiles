
{ lib
, stdenvNoCC
, fetchFromGitHub
, gnome-themes-extra
, gtk-engine-murrine
}:
stdenvNoCC.mkDerivation rec {
  name = "Lüv";
  pname = "Lüv";

  src = fetchFromGitHub {
    owner = "Nitrux";
    repo = "luv-icon-theme";
    rev = "cd15ec28e131d29fc1c1afaa289dc9a70d786428";
    sha256 = "jHmvDip1RhWYIxw5Bbxidgy9rVHFZeqdQQMbbZr357Q=";
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/icons/Lüv
    cp -a Luv/* $out/share/icons/Lüv
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
