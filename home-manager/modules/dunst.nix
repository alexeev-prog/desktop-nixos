{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.dunst;

in {
    options.modules.dunst = { enable = mkEnableOption "dunst"; };
    config = mkIf cfg.enable {
	home.packages = with pkgs; [
	    dunst
	];

        services.dunst = {
            enable = true;
            settings = {
                global = {
                    origin = "top-left";
                    offset = "60x12";
                    separator_height = 2;
                    padding = 12;
                    horizontal_padding = 12;
                    text_icon_padding = 12;
                    frame_width = 4;
                    separator_color = "frame";
                    idle_threshold = 120;
                    font = "JetBrainsMono Nerd 12";
                    line_height = 0;
                    format = "<b>%s</b>\n%b";
                    alignment = "center";
                    icon_position = "off";
                    startup_notification = "false";
                    corner_radius = 12;

                    frame_color = "#44465c";
                    background = "#303241";
                    foreground = "#d9e0ee";
                    timeout = 2;
                };
            };
        };
    };
}
# { config, pkgs, ... }:
# 
# {
#   services.dunst = {
#     enable = true;
#     settings = {
#       global = {
#         width = 300;
#         height = 100;
#         origin = "top-right";
#         offset = "10x50";
#         notification_limit = 5;
#         transparency = 10;
#         frame_color = "#1a1a1a";
#         separator_color = "frame";
#         font = "JetBrains Mono 10";
#       };
# 
#       urgency_low = {
#         background = "#1a1a1a";
#         foreground = "#abb2bf";
#         timeout = 4;
#       };
#       
#       urgency_normal = {
#         background = "#1a1a1a";
#         foreground = "#61afef";
#         timeout = 6;
#       };
#       
#       urgency_critical = {
#         background = "#1a1a1a";
#         foreground = "#e06c75";
#         frame_color = "#e06c75";
#         timeout = 0;
#       };
#     };
#   };
# }
