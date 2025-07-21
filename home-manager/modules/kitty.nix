# home-manager/modules/kitty.nix
{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font.name = "JetBrains Mono Nerd Font";
    font.size = 10;
    settings = {
      scrollback_lines = 10000;
      enable_audio_bell = false;
      background = "#1a1a1a";
      background_opacity = "0.8";
      foreground = "#abb2bf";
      cursor = "#61afef";
      selection_background = "#3e4451";
      window_padding_width = "10 7";
      confirm_os_window_close = 0;
      color0 = "#1a1a1a";
      color1 = "#e06c75";
      color2 = "#98c379";
      color3 = "#d19a66";
      color4 = "#61afef";
      color5 = "#c678dd";
      color6 = "#56b6c2";
      color7 = "#abb2bf";
      color8 = "#5c6370";
      color9 = "#e06c75";
      color10 = "#98c379";
      color11 = "#d19a66";
      color12 = "#61afef";
      color13 = "#c678dd";
      color14 = "#56b6c2";
      color15 = "#ffffff";
    };
    extraConfig = ''
      include current-theme.conf
      repaint_delay 10
      sync_to_monitor yes
      text_composition_strategy legacy
      
      mouse_hide_wait 3.0
      url_style double
      show_hyperlink_targets yes
    '';
  };
}
