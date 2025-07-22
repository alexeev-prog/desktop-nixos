# home-manager/modules/hyprland.nix
{ config, pkgs, ... }:

{
  imports = [ ./waybar.nix ];

  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ~/Downloads/images/milad.jpg
    wallpaper = ,~/Downloads/images/milad.jpg
  '';

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;

    settings = {
      exec-once = [
		  # "swaybg -i ~/Downloads/images/milad.jpg -m fill"
		  "swayidle -w timeout 300 'swaylock -f -c 000000' timeout 600 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on'"
		  "wl-paste --watch cliphist store"
		  "hyprpaper"
		  "waybar"
		  "mako"
		  "nm-applet"
		  "blueman-applet"
		  "swayidle -w timeout 300 'swaylock -f -c 000000'"
      ];

      windowrulev2 = [
      	"noborder, onworkspace:w[t1]"
        "float, class:(amberol)"
        "float, class:(steam)"
        "float, class:(TelegramDesktop)"
        "float, title:(Friends List)"
        "size 1000 600, class:(steam)"
        "move center, class:(steam)"
      ];

      env = [
        "XCURSOR_SIZE,24"
        "QT_QPA_PLATFORMTHEME,qt5ct"
      ];

      input = {
        kb_layout = "us,ru";
        kb_options = "grp:alt_shift_toggle";
        follow_mouse = 1;
        touchpad.natural_scroll = true;
      };

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        no_border_on_floating = false;
        # "col.active_border" = "rgba(61afefff)";
        # "col.inactive_border" = "rgba(595959aa)";
        "col.active_border" = "rgba(88a6ffff)";
        "col.inactive_border" = "rgba(1a1a1aff)";
        layout = "dwindle";
      };

      decoration = {
      	rounding = 6;
        blur = {
          enabled = true;
          size = 8;
          passes = 3;
          new_optimizations = true;
          noise = 0.01;
          contrast = 0.9;
          brightness = 0.8;
        };
      };
    
      # animations = {
      #   enabled = true;
      #   bezier = [
      #     "linear, 0, 0, 1, 1"
      #     "md3_decel, 0.05, 0.7, 0.1, 1"
      #     "overshot, 0.05, 0.9, 0.1, 1.05"
      #   ];
      #   animation = [
      #     "windows, 1, 3, md3_decel, popin"
      #     "windowsOut, 1, 3, md3_decel, popin"
      #     "border, 1, 10, default"
      #     "fade, 1, 3, default"
      #     "workspaces, 1, 3, overshot, slide"
      #   ];
      # };

      animations = {
        enabled = true;
        bezier = [
          "smooth, 0.4, 0, 0.2, 1"
          "overshot, 0.05, 0.9, 0.1, 1.1"
          "bounce, 0.5, 1, 0.89, 1"
        ];
        animation = [
          "windows, 1, 3, smooth, popin"
          "windowsOut, 1, 3, smooth, popin"
          "border, 1, 5, smooth"
          "fade, 1, 3, smooth"
          "workspaces, 1, 4, overshot, slidevert"
          "specialWorkspace, 1, 3, bounce, slidevert"
        ];
      };
    
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      # master.new_is_master = true;

      gestures.workspace_swipe = true;

      "$mod" = "SUPER";

      bind = [
        ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
        "$mod, RETURN, exec, kitty"
        "$mod, Q, killactive"
        "$mod, F, fullscreen"
        "$mod, D, exec, wofi -I -m -M=fuzzy --style ~/nixos/home-manager/modules/wofi.css --show drun -p \" Search\""
        "$mod, P, pseudo"
        "$mod, S, togglesplit"
        "$mod, T, togglefloating"
        "$mod SHIFT, T, togglegroup"
        
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
        
        "$mod, j, movefocus, l"
        "$mod, k, movefocus, r"
        "$mod, u, movefocus, u"
        "$mod, v, movefocus, d"
        
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"

        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        
        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"
        "$mod SHIFT, L, exec, swaylock -c 000000"
        "$mod, P, exec, systemctl suspend"
        ", Print, exec, grim -g \"$(slurp)\" - | wl-copy"
        "SHIFT, Print, exec, grim -g \"$(slurp)\" ~/Pictures/Screenshots/$(date +'%Y-%m-%d_%H-%M-%S').png"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"
        "$mod SHIFT, B, exec, firefox"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
    };
  };

  services.mako = {
     backgroundColor = "#1e1e2e";
     textColor = "#cdd6f4";
     borderColor = "#cba6f7";
     borderRadius = 12;
     padding = "15,20";
     margin = "20,20";
     width = 350;
     height = 150;
     font = "JetBrains Mono 10";
   };

  home.file.".config/rofi/config.rasi".text = ''
    configuration {
      modi: "drun,run,window";
      icon-theme: "Colloid-dark";
      show-icons: true;
      location: 0;
      width: 30%;
      lines: 8;
      padding: 30px;
      border-radius: 15px;
      background: #1e1e1e;
      background-border: #58a6ff;
      border-width: 1px;
    }
    
    * {
      text-color: #c9d1d9;
      accent-color: #58a6ff;
      background-color: transparent;
    }
    
    window {
      background-color: rgba(13, 17, 23, 0.95);
      border-radius: 12px;
      padding: 20px;
    }
    
    entry {
      placeholder: "Search...";
      padding: 12px;
      background-color: rgba(22, 27, 34, 0.8);
      border-radius: 8px;
      margin: 0 0 15px 0;
    }
    
    listview {
      padding: 8px 0;
      background-color: transparent;
      border-radius: 8px;
    }
    
    element {
      padding: 8px;
      border-radius: 6px;
    }
    
    element selected {
      background-color: rgba(88, 166, 255, 0.2);
    }
    
    element-icon {
      size: 24px;
    }
  '';
}
