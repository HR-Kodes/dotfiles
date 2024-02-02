{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    fd lazygit ripgrep # Direct lazyvim dependencies
    gcc gnumake cmake autoconf automake libtool # C/C++ tools
  ];

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    extraLuaConfig = ''
      -- Write Lua Code Here
      
      ${builtins.readFile ./init.lua}
     '';
   };
}
