{ config, pkgs, lib, ... }:

{
  programs.wlogout = {
    enable = true;
    package = pkgs.wlogout;
    layout = [
{
    label = "lock";
    action = "sleep 1; swaylock";
    # text = "Lock";
    keybind = "l";
}
{
    label =  "hibernate";
    action = "sleep 1; systemctl hibernate";
    # text = "Hibernate";
    keybind = "h";
}
{
    label = "logout";
    action = "sleep 1; hyprctl dispatch exit";
    # text = "Exit";
    keybind = "e";
}
{
    label = "shutdown";
    action = "sleep 1; systemctl poweroff";
    # text = "Shutdown";
    keybind = "s";
}
{    label = "suspend";
    action = "sleep 1; systemctl suspend";
    # text = "Suspend";
    keybind = "u";
}
{
    label = "reboot";
    action = "sleep 1; systemctl reboot";
    # text = "Reboot";
    keybind = "r";
}
     ];






    style = ''
/*
          _                         _    
__      _| | ___   __ _  ___  _   _| |_  
\ \ /\ / / |/ _ \ / _` |/ _ \| | | | __| 
 \ V  V /| | (_) | (_| | (_) | |_| | |_  
  \_/\_/ |_|\___/ \__, |\___/ \__,_|\__| 
                  |___/                  
 
----------------------------------------------------- 
*/

/* -----------------------------------------------------
 * General 
 * ----------------------------------------------------- */

* {
    font-family: "Fira Sans Semibold", FontAwesome, Roboto, Helvetica, Arial, sans-serif;
	background-image: none;
	transition: 20ms;
}

window {
	/* background-color: rgba(12, 12, 12, 0.1); */
	background-color: rgba(12, 12, 12, 0.0);
}

button {
	color: #FFFFFF;
    font-size:20px;

    background-repeat: no-repeat;
	background-position: center;
	background-size: 25%;

  background-color: #2A323B;

    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}

button:focus,
button:active,
button:hover {
    color: rgba(0,255,153, 0.5);
    background-color: #B4A1DB;
}

/* 
----------------------------------------------------- 
Buttons
----------------------------------------------------- 
*/

#lock {
	margin: 10px;
	border-radius: 20px;
	background-image: image(url("/home/koushikhr/.wlogout-icons/lock.png"));
	background-size: 3.5rem;
}

#logout {
	margin: 10px;
	border-radius: 20px;
	background-image: image(url("/home/koushikhr/.wlogout-icons/logout.png"));
	background-size: 3.5rem;
}

#suspend {
	margin: 10px;
	border-radius: 20px;
	background-image: image(url("/home/koushikhr/.wlogout-icons/suspend.png"));
	background-size: 3.5rem;
}

#hibernate {
	margin: 10px;
	border-radius: 20px;
	background-image: image(url("/home/koushikhr/.wlogout-icons/hibernate.png"));
	background-size: 3.5rem;
}

#shutdown {
	margin: 10px;
	border-radius: 20px;
	background-image: image(url("/home/koushikhr/.wlogout-icons/shutdown.png"));
	background-size: 3.5rem;
}

#reboot {
	margin: 10px;
	border-radius: 20px;
	background-image: image(url("/home/koushikhr/.wlogout-icons/reboot.png"));
	background-size: 3.5rem;
}
     '';






#    style = ''
#/*
#          _                         _    
#__      _| | ___   __ _  ___  _   _| |_  
#\ \ /\ / / |/ _ \ / _` |/ _ \| | | | __| 
# \ V  V /| | (_) | (_| | (_) | |_| | |_  
#  \_/\_/ |_|\___/ \__, |\___/ \__,_|\__| 
#                  |___/                  
# 
#----------------------------------------------------- 
#*/
#
#/* -----------------------------------------------------
# * General 
# * ----------------------------------------------------- */
#
#* {
#    font-family: "Fira Sans Semibold", FontAwesome, Roboto, Helvetica, Arial, sans-serif;
#	background-image: none;
#	transition: 20ms;
#}
#
#window {
#	/* background-color: rgba(12, 12, 12, 0.1); */
#	background-color: rgba(12, 12, 12, 0.0);
#}
#
#button {
#	color: #FFFFFF;
#    font-size:20px;
#
#    background-repeat: no-repeat;
#	background-position: center;
#	background-size: 25%;
#
#	border-style: solid;
#	background-color: rgba(12, 12, 12, 0.3);
#	border: 2px solid #FFFFFF;
#
#    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
#}
#
#button:focus,
#button:active,
#button:hover {
#    /* color: rgba(33ccffee) rgba(00ff99ee) 45deg; */
#    /* background-color: rgba(12, 12, 12, 0.5); */
#    /* border: 3px solid rgba(33ccffee) rgba(00ff99ee) 45deg; */
#    
#    color: rgba(0,255,153, 0.5);
#    background-color: rgba(12, 12, 12, 0.5);
#    border: 2px solid rgba(0,255,153, 0.5);
#}
#
#/* 
#----------------------------------------------------- 
#Buttons
#----------------------------------------------------- 
#*/
#
##lock {
#	margin: 10px;
#	border-radius: 20px;
#	background-image: image(url("/home/koushikhr/.wlogout-icons/lock.png"));
#	background-size: 3.5rem;
#}
#
##logout {
#	margin: 10px;
#	border-radius: 20px;
#	background-image: image(url("/home/koushikhr/.wlogout-icons/logout.png"));
#	background-size: 3.5rem;
#}
#
##suspend {
#	margin: 10px;
#	border-radius: 20px;
#	background-image: image(url("/home/koushikhr/.wlogout-icons/suspend.png"));
#	background-size: 3.5rem;
#}
#
##hibernate {
#	margin: 10px;
#	border-radius: 20px;
#	background-image: image(url("/home/koushikhr/.wlogout-icons/hibernate.png"));
#	background-size: 3.5rem;
#}
#
##shutdown {
#	margin: 10px;
#	border-radius: 20px;
#	background-image: image(url("/home/koushikhr/.wlogout-icons/shutdown.png"));
#	background-size: 3.5rem;
#}
#
##reboot {
#	margin: 10px;
#	border-radius: 20px;
#	background-image: image(url("/home/koushikhr/.wlogout-icons/reboot.png"));
#	background-size: 3.5rem;
#}
#     '';
   };
}
