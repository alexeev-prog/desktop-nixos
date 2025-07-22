# home-manager/modules/waybar.nix
{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = [{
      height = 30;
      layer = "top";
      position = "top";

      modules-left = [
        "hyprland/workspaces"
        "hyprland/window"
      ];
      
      modules-center = [
        "clock"
      ];
      
      modules-right = [
        "custom/keyboard"
        "cpu"
        "memory"
        "pulseaudio"
        "backlight"
        "network"
        "bluetooth"
        "battery"
        "tray"
        "custom/notification"
      ];

      "custom/notification" = {
        # exec = "echo ' '";
        exec = "makoctl list | grep -c '^Notification'";
        # format = " {}";
        tooltip = false;
        format = " {}";
        interval = 1;
        on-click = "makoctl dismiss";
        on-click-right = "makoctl restore";
      };

      "custom/keyboard" = {
        exec = "hyprctl devices -j | jq -r '.keyboards[] | select(.name == \"juchen-usb-keyboard\") | .active_keymap' | cut -c 1-2 | tr 'A-Z' 'a-z'";
        interval = 1;
        format = "⌨ {}";
        on-click = "hyprctl switchxkblayout at-translated-set-2-keyboard next";
        tooltip = false;
      };

      "hyprland/workspaces" = {
        format = "{icon}";
        format-icons = {
			"1" = "一";
			"2" = "二";
			"3" = "三";
			"4" = "四";
			"5" = "五";
			"6" = "〶";
			"7" = "七";
			"8" = "八";
			"9" = "九";
			"10" = "十";
          "active" = " ";
          "default" = " ";
        };
        on-click = "activate";
      };

      "hyprland/window" = {
        format = "{}";
        max-length = 50;
      };

      cpu = {
        format = " {usage}%";
        interval = 1;
        tooltip = false;
      };

      # Memory Widget
      memory = {
        format = " {percentage}%";
        interval = 2;
        tooltip = false;
      };

      # Improved Battery Widget
      battery = {
        states = {
          good = 90;
          warning = 30;
          critical = 15;
        };
        format = "{icon} {capacity}%";
        format-charging = " {capacity}%";
        format-plugged = " {capacity}%";
        format-full = "  Full";
        format-alt = "{time} {icon}";
        format-icons = [" " " " " " " " " "];
      };

      backlight = {
        device = "intel_backlight";
        format = "{icon} {percent}%";
        format-icons = ["" "" "" "" "" "" "" "" ""];
        on-scroll-up = "brightnessctl set 1%+";
        on-scroll-down = "brightnessctl set 1%-";
      };

      bluetooth = {
        format = " {status}";
        format-disabled = "";
        format-connected = " {device_alias}";
        tooltip-format = "{controller_alias}\t{controller_address}";
        tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{device_enumerate}";
        tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
        on-click = "blueman-manager";
      };

      pulseaudio = {
        format = "{icon} {volume}%";
        format-muted = " Muted";
        format-icons = {
          headphone = " ";
          hands-free = " ";
          headset = " ";
          phone = " ";
          portable = " ";
          car = " ";
          default = [" " " "];
        };
        scroll-step = 5;
        on-click = "pamixer -t";
        on-click-right = "pavucontrol";
      };

      network = {
        format-wifi = "  {essid}";
        format-ethernet = "  {ifname}";
        format-linked = "  {ifname} (No IP)";
        format-disconnected = "⚠ Disconnected";
        tooltip-format = "{ifname}: {ipaddr}/{cidr}";
        on-click = "nm-connection-editor";
      };

      clock = {
        interval = 60;
        format = "  {:%Y-%m-%d %H:%M}";
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
      };

      tray = {
        icon-size = 15;
        spacing = 5;
      };
    }];

	style = ''
	  * {
	    font-family: "JetBrains Mono", monospace;
	    font-size: 12px;
	    min-height: 0;
	  }
	  
	  window#waybar {
	    background-color: rgba(25, 25, 25, 0.95);
	    color: #e0e0e0;
	    border: none;
	    border-radius: 0;
	    padding: 0;
	    margin: 0;
	  }
	  
	  #workspaces {
	    padding: 0 2px;
	  }
	  
	  #workspaces button {
	    color: #6c6c6c;
	    background: transparent;
	    border: none;
	    padding: 0 6px;
	    margin: 0 1px;
	  }
	  
	  #workspaces button.active {
	    color: #61afef;
	    border-bottom: 2px solid #61afef;
	  }
	  
	  #workspaces button.urgent {
	    color: #e06c75;
	  }
	  
	  #window {
	    color: #d0d0d0;
	    padding: 0 10px;
	  }
	  
	  #clock {
	    color: #e5c07b;
	    background-color: rgba(40, 40, 40, 0.9);
	    border-radius: 4px;
	    padding: 0 12px;
	    margin: 4px 3px;
	    font-weight: bold;
	    border: 1px solid rgba(60, 60, 60, 0.6);
	  }
	  
	  #custom-notification, 
	  #pulseaudio, 
	  #backlight, 
	  #network, 
	  #bluetooth, 
	  #battery, 
	  #tray, 
	  #custom-keyboard, 
	  #cpu, 
	  #memory {
	    background-color: rgba(40, 40, 40, 0.9);
	    border-radius: 4px;
	    padding: 0 10px;
	    margin: 4px 3px;
	    border: 1px solid rgba(60, 60, 60, 0.6);
	  }
	  
	  #custom-notification { color: #e5c07b; }
	  #pulseaudio { color: #c678dd; }
	  #backlight { color: #e5c07b; }
	  #network { color: #61afef; }
	  #bluetooth { color: #61afef; }
	  #custom-keyboard { color: #abb2bf; }
	  #cpu { color: #98c379; }
	  #memory { color: #56b6c2; }
	  
	  #battery { color: #98c379; }
	  #battery.charging { color: #98c379; }
	  #battery.warning:not(.charging) { color: #e5c07b; }
	  #battery.critical:not(.charging) {
	    color: #e06c75;
	    animation: blink-critical 1s infinite;
	  }
	  
	  @keyframes blink-critical {
	    50% { opacity: 0.3; }
	  }
	  
	  #network.disconnected,
	  #bluetooth.disabled {
	    color: #6c6c6c;
	    background-color: rgba(40, 40, 40, 0.6);
	  }
	  
	  #tray {
	    padding: 0 8px;
	  }
	  
	  tooltip {
	    background-color: rgba(25, 25, 25, 0.95);
	    border: 1px solid #4a4a4a;
	    border-radius: 4px;
	  }
	'';
  };
}
