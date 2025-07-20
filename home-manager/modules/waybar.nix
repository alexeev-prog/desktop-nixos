# home-manager/modules/waybar.nix
{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = [{
      height = 30;
      layer = "top";
      position = "top";

      modules-left = [ "hyprland/workspaces" ];
      modules-center = [ "hyprland/window" ];
      modules-right = [
        "memory"
        "cpu"
        "temperature"
        "pulseaudio"
        "network"
        "custom/bluetooth"
        "clock"
        "tray"
      ];

      # "hyprland/workspaces" = {
      #   format = "{icon}";
      #   format-icons = ["1" "2" "3" "4" "5"];
      #   persistent-workspaces = {
      #     "*" = 5;
      #   };
      # };

      memory = {
        interval = 5;
        format = " {percentage}%";
        tooltip = true;
      };

      cpu = {
        interval = 5;
        format = " {usage}%";
        tooltip = true;
      };

      temperature = {
        interval = 5;
        thermal-zone = 0;
        format = " {temperatureC}°C";
        critical-threshold = 80;
      };

      network = {
        interval = 5;
        format-wifi = " {essid}";
        format-ethernet = " {ipaddr}";
        format-disconnected = "⚠ Disconnected";
        tooltip-format = "{ifname}: {ipaddr}";
        on-click = "nm-connection-editor"; 
        on-click-right = "nmtui"; 
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
        on-click = "pamixer -t";  # Вкл/выкл звук
        on-click-right = "pavucontrol";  # Открыть микшер
      };

      "custom/bluetooth" = {
        format = "{}";
        interval = 30;
        exec = "echo ''";
        exec-if = "which bluetoothctl";
        return-type = "json";
        on-click = "blueman-manager";
        signal = 8;
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
      }
      
      window#waybar {
        background-color: #1a1a1a;
        color: #abb2bf;
        border-bottom: 1px solid #2c2c2c;
      }
      
      #workspaces button {
        color: #5c6370;
        padding: 0 5px;
      }
      
      #workspaces button.active {
        color: #61afef;
      }
      
      #memory, #cpu, #temperature, #pulseaudio, #network {
        padding: 0 8px;
        margin: 0 4px;
        border-radius: 4px;
        background-color: #252525;
      }
      
      #clock {
        padding: 0 10px;
        margin-left: 6px;
      }
    '';
  };
}
