{pkgs, ...}: {
  # FISH -> Setting default shell to fish.
  environment.shells = with pkgs; [bash fish zsh];
  users.defaultUserShell = pkgs.fish;
  programs.fish = {
    enable = true;
    loginShellInit = "starship init fish | source";
    # initExtra = ''
    #   ${pkgs.neofetch}/bin/neofetch
    #  '';

    # ${pkgs.fastfetch}/bin/fastfetch
  };
  programs.zsh.interactiveShellInit = ''eval "$(direnv hook zsh)"'';
  programs.fish.interactiveShellInit = ''
    set fish_greeting # Disable greeting
    # ${pkgs.fastfetch}/bin/fastfetch --config examples/13
    eval "$(direnv hook fish)"
    starship init fish | source
  '';
}
