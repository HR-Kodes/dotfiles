{ config, pkgs, lib, ... }:

{
  programs.wofi = {
    enable = true;
    package = pkgs.wofi;
    settings = {
      show = "run";
      # key_expand = "End";

      # --- Try this settings --- # 
      hide_scroll = true;
      width = "45%";
      lines = "11";
      line_wrap = "word";
      term = "foot";
      allow_markup = "true";
      always_parse_args = false;
      show_all = true;
      print_command = true;
      layer = "overlay";
      allow_images = true;
      sort_order = "default";
      gtk_dark = true;
      image_size = "20";
      display_generic = false;
      location = "center";
      key_expand = "Tab";
      insensitive = false;
      single_click = true;
     };

   # style = ''
   #   window {
   #     font-size:12px;
   #     background-color:#1c1c1c;
   #     margin:4px;
   #     border:1px solid orange;
   #     color:#d5c4a1;
   #     font-family:"FiraCode Nerd Font";
   #    }

   #   #entry:selected {
   #     background-color:orange;
   #    }

   #   #text:selected {
   #     color:black;
   #     font-weight:bold;
   #    }

   #   #input {
   #     background-color:#282828;
   #     border:0.5px solid orange;
   #     color:#b8bb26;
   #     padding:2px;
   #    }

   #   #input:enabled {
   #     background-color:black;
   #     border:1px solid transparent;
   #    }
   #  '';

    style = ''
      * {
        font-family: JetBrainsMono, SpaceMono;
        color: #e5e9f0;
        /* background: transparent; */
       }

      #window {
        background: rgba(41, 46, 66, 0.5);
        margin: auto;
        padding: 1rem;
        border-radius: 1rem;
        border: 2px solid #16a187;
        background-color: #151515;
        opacity: 0.9;
       }

      #input {
        padding: 0.9rem;
        margin-bottom: 10px;
        border-radius: 0.5rem;
       }

      #outer-box {
        padding: 1.25rem;
       }
      
      #img {
        margin-right: 0.5rem;
       }
      
      #entry {
        padding: 10px;
        border-radius: 10px;
       }
      
      #entry:selected {
        background-color: #16a187;
       }
      
      #text {
        margin: 2px;
       }
     '';
   };
}
