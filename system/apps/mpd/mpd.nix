{ config, pkgs, lib, ... }:

{
    environment.systemPackages = with pkgs; [
      mpc-cli mpd
    ];

    services.mpd = {
        enable = true;
        user = "koushikhr";
        musicDirectory = "/home/koushikhr/Music/mpd";
        extraConfig = ''
            # must specify one or more outputs in order to play audio!
            # (e.g. ALSA, PulseAudio, PipeWire), see next sections

            audio_output {
                # type "pulse"
                # name "Pulseaudio"
                # server "127.0.0.1" # add this line - MPD must connect to the local sound server

                type "pipewire"
                name "My Pipewire output"
            }
        '';

        # Optional:
        network.listenAddress = "any"; # if you want to allow non-localhost connections
        startWhenNeeded = true;
        # network = {
        #   startWhenNeeded = true;
        # };
    };

  # systemd.services.mpd.environment = {
  #     XDG_RUNTIME_DIR =
  #         "/run/user/1000"; # User-id 1000 must match above user. MPD will look inside this directory for the PipeWire socket.
  #     };
}