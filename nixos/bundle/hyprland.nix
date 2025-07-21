# nixos/bundle/hyprland.nix
{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    grim
    slurp
    wl-clipboard
    swaybg
    mako
    swaylock
    swayidle
    
    pyprland
    hyprpicker
    hyprcursor
    hyprlock
    hypridle
    hyprpaper

    starship
    helix

    qutebrowser
    zathura
    mpv
    imv

    dunst
    rofi
    rofi-wayland
    rofimoji
    waybar
    wlogout
    eww
    swaynotificationcenter
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # environment.sessionVariables = {
  #   NIXOS_OZONE_WL = "1";
  #   GDK_BACKEND = "wayland";
  #   QT_QPA_PLATFORM = "wayland";
  #   SDL_VIDEODRIVER = "wayland";
  #   CLUTTER_BACKEND = "wayland";
  # };

  security.pam.services.swaylock.text = "auth include login";
}
