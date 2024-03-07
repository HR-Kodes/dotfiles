{ pkgs, home-manager, ... }:

{
    home.file = {
      #".config/mako/config".text = ''
      #  font=M+1Code Nerd Font
      #  format=<b>%a ⏵</b> %s\n%b
      #  sort=-time
      #  output=DP-2
      #  layer=overlay
      #  anchor=top-center
      #  background-color=#221A3B
      #  width=300
      #  height=110
      #  margin=5
      #  padding=0,5,10
      #  border-size=2
      #  border-color=#08995A
      #  border-radius=15
      #  icons=0
      #  max-icon-size=64
      #  default-timeout=5000
      #  ignore-timeout=1

      #  [urgency=normal]
      #  border-color=#2797BE

      #  [urgency=high]
      #  border-color=#D82A57
      #  default-timeout=0
      #'';

      ".config/mako/config".text = ''
        ## Mako configuration file
        
        # GLOBAL CONFIGURATION OPTIONS
        max-history=100
        sort=-time
        
        # BINDING OPTIONS
        on-button-left=dismiss
        on-button-middle=none
        on-button-right=dismiss-all
        on-touch=dismiss
        on-notify=exec mpv $HOME/.dotfiles/user/theme/notification/notify-1.mp3
        
        # STYLE OPTIONS
        font=JetBrains Mono 10
        width=300
        height=100
        margin=10
        padding=15
        border-size=2
        border-radius=0
        icons=1
        max-icon-size=48
        icon-location=left
        icon-path="/home/koushikhr/.nix-profile/share/icons/hicolor:/run/current-system/sw/share/icons/hicolor"
        markup=1
        actions=1
        history=1
        text-alignment=left
        default-timeout=5000
        ignore-timeout=0
        max-visible=5
        layer=overlay
        anchor=top-right
        
        background-color=#1e1e2e
        text-color=#d9e0ee
        border-color=#313244
        progress-color=over #89b4fa
        
        [urgency=low]
        border-color=#313244
        default-timeout=2000
        
        [urgency=normal]
        border-color=#313244
        default-timeout=5000
        
        [urgency=high]
        border-color=#f38ba8
        text-color=#f38ba8
        default-timeout=0
        
        [category=mpd]
        border-color=#f9e2af
        default-timeout=2000
        group-by=category
      '';
    };
}
