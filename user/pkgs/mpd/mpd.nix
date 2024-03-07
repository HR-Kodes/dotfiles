{ config, pkgs, lib, ... }:

{
    home.packages = with pkgs; [
      mpd ncmpcpp mpc-cli
    ];

    home.file = {
        ".config/mpd/mpd.conf".text = ''
            ####### MPD CONFIG #######

            # Required files
            db_file            "~/.config/mpd/database"
            log_file           "~/.config/mpd/log"

            # Optional
            music_directory    "~/Music"
            playlist_directory "/home/koushikhr/Music/mpd"
            pid_file           "~/.config/mpd/pid"
            state_file         "~/.config/mpd/state"
            sticker_file       "~/.config/mpd/sticker.sql"

            # audio_output {  
                # type  "alsa"  
                # name  "mpd alsamixer-output"
                # mixer_type "software"

            #     type		"pipe"
            #     name		"my pipe"
            #     command		"aplay -f cd 2>/dev/null"
            # }

            # audio_output {  
            #     type               "fifo"  
            #     name               "toggle_visualizer"
            #     path               "/tmp/mpd.fifo"
            #     format             "44100:16:2"
            # }


audio_output {
        type            "pulse"
        name            "pulse audio"
        mixer_type      "hardware"      # optional
        mixer_device    "default"       # optional
        mixer_control   "PCM"           # optional
        mixer_index     "0"             # optional
}

audio_output {
    type                    "fifo"
    name                    "my_fifo"
    path                    "/tmp/mpd.fifo"
    format                  "44100:16:2"
}


            ####### END MPD CONFIG #######
        '';
    };
}