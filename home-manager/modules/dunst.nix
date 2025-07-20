{ config, pkgs, ... }:

{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        width = 300;
        height = 100;
        origin = "top-right";
        offset = "10x50";
        notification_limit = 5;
        transparency = 10;
        frame_color = "#1a1a1a";
        separator_color = "frame";
        font = "JetBrains Mono 10";
      };

      urgency_low = {
        background = "#1a1a1a";
        foreground = "#abb2bf";
        timeout = 4;
      };
      
      urgency_normal = {
        background = "#1a1a1a";
        foreground = "#61afef";
        timeout = 6;
      };
      
      urgency_critical = {
        background = "#1a1a1a";
        foreground = "#e06c75";
        frame_color = "#e06c75";
        timeout = 0;
      };
    };
  };
}
