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
          "active" = "";
          "default" = "";
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
        scroll-step = 1;
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
        font-family: "JetBrains Mono Nerd Font", "Iosevka Nerd Font";
        font-size: 13px;
        color: #c9d1d9;
      }
      
      window#waybar {
        background: transparent;
        border: none;
      }
      
      #workspaces button {
        background: transparent;
        border: none;
        box-shadow: none;
        padding: 0 6px;
      }
      
      #workspaces button.active {
        color: #58a6ff;
        background-color: rgba(22, 22, 22, 0.15);
        border-radius: 4px;
      }
      
      #window {
        color: #8b949e;
        padding: 0 12px;
      }
      
      #clock, #workspaces, #pulseaudio, #notification, #backlight, #network, #bluetooth, 
      #battery, #tray, #custom-keyboard, #cpu, #memory {
        background-color: #2f2f2f;
        border: 1px solid #1a1a1a;
        padding: 0 8px;
        margin: 0 4px;
        border-radius: 6px;
      }

      #battery.charging, #battery.plugged {
        color: #98c379;
      }
      
      #battery.warning:not(.charging) {
        color: #d19a66;
      }
      
      #battery.critical:not(.charging) {
        color: #e06c75;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }
      
      @keyframes blink {
        to {
          background-color: rgba(224, 108, 117, 0.2);
        }
      }
      
      #clock {
        color: #efefef;
        font-weight: bold;
      }
      
      #pulseaudio {
        color: #c9d1d9;
      }
      
      #backlight {
        color: #c9d1d9; 
      }
      
      #network {
        color: #c9d1d9; 
      }
      
      #bluetooth {
        color: #c9d1d9;  
      }
      
      #battery {
        color: #c9d1d9;  
      }
      
      #custom-keyboard {
        color: #c9d1d9; 
      }
    '';
  };
}
