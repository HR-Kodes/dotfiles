{
  pkgs,
  lib,
  ...
}: {
  xdg = {
    configFile.nvim.source = ./nvchad-nvim-config;
    desktopEntries."nvim" = lib.mkIf pkgs.stdenv.isLinux {
      name = "NeoVim";
      comment = "Edit text files";
      icon = "nvim";
      exec = "xterm -e ${pkgs.neovim}/bin/nvim %F";
      categories = ["TerminalEmulator"];
      terminal = false;
      mimeType = ["text/plain"];
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    withRuby = true;
    withNodeJs = true;
    withPython3 = true;

    extraPackages = with pkgs; [
      git
      gcc
      gnumake
      unzip
      wget
      curl
      tree-sitter
      ripgrep
      fd
      fzf
      cargo

      nil
      lua-language-server
      stylua
      alejandra
    ];
  };
}
#
#
# { config, pkgs, lib, ... }:
#
# {
#   home.packages = with pkgs; [
#     fd lazygit ripgrep # Direct lazyvim dependencies
#     gcc gnumake cmake autoconf automake libtool # C/C++ tools
#   ];
#
#   programs.neovim = {
#     enable = true;
#     viAlias = true;
#     vimAlias = true;
#     vimdiffAlias = true;
#     extraLuaConfig = ''
#       -- Write Lua Code Here
#
#       ${builtins.readFile ./init.lua}
#      '';
#    };
# }
#
#

