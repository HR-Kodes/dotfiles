{ lib
, stdenvNoCC
, fetchFromGitHub
, gnome-themes-extra
, gtk-engine-murrine
}:

stdenvNoCC.mkDerivation rec {
  pname = "colorful-plasma-gtk-theme";
  name = "Colorful-Dark-GTK";
  # version = "unstable-2022-12-09";

  src = fetchFromGitHub {
    owner = "L4ki";
    repo = "Colorful-Plasma-Themes";
    rev = "bf0e10f8985bd12ef875929c55ca6a58e64ac2f8";
    hash = "sha256-60SPsfMKmnF2Iw9G5f305gTVpwoTm7aPkXHVn8Vxc2g=";
  };

  # propagatedUserEnvPkgs = [
  #   gtk-engine-murrine
  # ];

  # buildInputs = [
  #   gnome-themes-extra
  # ];

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/themes
    mkdir -p $out/share/icons
    cp -a "Colorful GTK Themes"/* $out/share/themes
    cp -a "Colorful Icons Themes"/* $out/share/icons
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
