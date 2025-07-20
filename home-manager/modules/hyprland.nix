# home-manager/modules/hyprland.nix
{ config, pkgs, ... }:

{
  imports = [ ./waybar.nix ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;

    settings = {
      exec-once = [
		  "swaybg -i ~/Downloads/images/nix-wallpaper-nineish-dark-gray.png -m fill"
		  "waybar"
		  "mako"
		  "nm-applet"
		  "blueman-applet"
		  "swayidle -w timeout 300 'swaylock -f -c 000000'"
      ];

      env = [
        "XCURSOR_SIZE,24"
        "QT_QPA_PLATFORMTHEME,qt5ct"
      ];

      input = {
        kb_layout = "us";
        follow_mouse = 1;
        touchpad.natural_scroll = true;
      };

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        # "col.active_border" = "rgba(61afefff)";
        # "col.inactive_border" = "rgba(595959aa)";
        "col.active_border" = "rgba(88a6ffff)";
        "col.inactive_border" = "rgba(1a1a1aff)";
        layout = "dwindle";
      };

      decoration = {
        rounding = 12;
        blur = {
          enabled = true;
          size = 5;
          passes = 3;
          new_optimizations = true;
          # Add blur rules for Kitty
          ignore_opacity = true;
          special = true;
        };
        # drop_shadow = true;
        # shadow_range = 15;
        # shadow_render_power = 3;
        # shadow_ignore_window = true;
        # "col.shadow" = "rgba(00000099)";
      };
    
      animations = {
        enabled = true;
        bezier = [
          "linear, 0, 0, 1, 1"
          "md3_decel, 0.05, 0.7, 0.1, 1"
          "overshot, 0.05, 0.9, 0.1, 1.05"
        ];
        animation = [
          "windows, 1, 3, md3_decel, popin"
          "windowsOut, 1, 3, md3_decel, popin"
          "border, 1, 10, default"
          "fade, 1, 3, default"
          "workspaces, 1, 3, overshot, slide"
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
        "$mod, D, exec, wofi -show drun"
        "$mod, P, pseudo"
        "$mod, S, togglesplit"
        
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
    enable = true;
    backgroundColor = "#1a1a1a";
    textColor = "#abb2bf";
    borderColor = "#61afef";
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
