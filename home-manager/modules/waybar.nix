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
        "pulseaudio"
        "backlight"
        "network"
        "bluetooth"
        "battery"
        "tray"
      ];

      "custom/keyboard" = {
        exec = "hyprctl devices | grep -A 2 'keyboard' | grep 'active keymap' | awk '{print $3}' | head -n1";
        interval = 2;
        format = "⌨ {}";
        on-click = "hyprctl switchxkblayout next";
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
          "active" = "";
          "default" = "";
        };
        on-click = "activate";
      };

      "hyprland/window" = {
        format = "{}";
        max-length = 50;
      };

      backlight = {
        device = "intel_backlight";
        format = "{icon} {percent}%";
        format-icons = ["" "" "" "" "" "" "" "" ""];
        on-scroll-up = "brightnessctl set 5%+";
        on-scroll-down = "brightnessctl set 5%-";
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
          headphone = "";
          hands-free = "";
          headset = "";
          phone = "";
          portable = "";
          car = "";
          default = ["" ""];
        };
        scroll-step = 1;
        on-click = "pamixer -t";
        on-click-right = "pavucontrol";
      };

      network = {
        format-wifi = " {essid}";
        format-ethernet = " {ifname}";
        format-linked = " {ifname} (No IP)";
        format-disconnected = "⚠ Disconnected";
        tooltip-format = "{ifname}: {ipaddr}/{cidr}";
        on-click = "nm-connection-editor";
      };

      clock = {
        interval = 60;
        format = " {:%H:%M}";
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
      };

      tray = {
        icon-size = 15;
        spacing = 5;
      };
    }];

    style = ''
      * {
        font-family: "JetBrains Mono Nerd Font", "Iosevka Nerd Font";
        font-size: 12px;
        color: #c9d1d9;
      }
      
      window#waybar {
        background-color: #1a1a1a;
        border-bottom: 1px solid rgba(40, 40, 40, 0.5);
      }
      
      #workspaces button {
        background: transparent;
        border: none;
        box-shadow: none;
        padding: 0 6px;
      }
      
      #workspaces button.active {
        color: #58a6ff;
        background-color: rgba(33, 33, 33, 0.15);
        border-radius: 4px;
      }
      
      #window {
        color: #8b949e;
        padding: 0 12px;
      }
      
      #clock, #pulseaudio, #backlight, #network, #bluetooth, #battery, #tray, #custom-keyboard {
        background-color: rgba(22, 22, 22, 0.8);
        padding: 0 12px;
        margin: 0 4px;
        border-radius: 6px;
      }
      
      #clock {
        color: #f0883e;
        font-weight: bold;
      }
      
      #pulseaudio {
        color: #3fb950;
      }
      
      #backlight {
        color: #d29922; 
      }
      
      #network {
        color: #58a6ff; 
      }
      
      #bluetooth {
        color: #bc8cff;  
      }
      
      #battery {
        color: #ff7b72;  
      }
      
      #custom-keyboard {
        color: #8b949e; 
      }
    '';
  };
}
