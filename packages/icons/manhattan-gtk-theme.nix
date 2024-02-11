{ 
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  gnome-themes-extra,
  gtk-engine-murrine
}:

stdenvNoCC.mkDerivation rec {
  pname = "manhattan.gtk";
  name = "manhattan.gtk";
  # version = "unstable-2022-12-09";

  src = fetchFromGitHub {
    owner = "jadnw";
    repo = "manhattan.gtk";
    rev = "de0af1c4bb25d96b9bae5f30d091f0c53580bee3";
    hash = "sha256-G6fcEmiiyO3ZwyeievX5O53+ATYgSgb0KSkAzitmacg=";
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
    cp -a themes/* $out/share/themes
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
