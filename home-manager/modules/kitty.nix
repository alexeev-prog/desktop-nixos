# home-manager/modules/kitty.nix
{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font.name = "JetBrains Mono Nerd Font";
    font.size = 12;
    settings = {
      scrollback_lines = 10000;
      enable_audio_bell = false;
      background = "#1a1a1a";
      foreground = "#abb2bf";
      cursor = "#61afef";
      selection_background = "#3e4451";
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
    '';
  };
}
