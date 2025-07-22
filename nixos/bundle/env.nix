# {
#   environment.variables = {
#     EDITOR = "nvim";
#     RANGER_LOAD_DEFAULT_RC = "FALSE";
#     QT_QPA_PLATFORMTHEME = "qt5ct";
#     GSETTINGS_BACKEND = "keyfile";
#   };
# 
#   environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
# }

# nixos/bundle/env.nix
{ config, pkgs, ... }: {

  environment.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "1";
  };
  environment.variables = {
    EDITOR = "nvim";
    RANGER_LOAD_DEFAULT_RC = "FALSE";
    # QT_QPA_PLATFORMTHEME = "qt5ct";
    GSETTINGS_BACKEND = "keyfile";
    BROWSER = "firefox";
    NIXOS_XDG_OPEN_USE_PORTAL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    CLUTTER_BACKEND = "wayland";
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
    GDK_BACKEND = "wayland";
    SDL_VIDEODRIVER = "wayland";
    GTK_USE_PORTAL = "1";     # Форсирует использование порталов
    QT_QPA_PLATFORM = "wayland"; # Qt-приложения используют GTK
  };
}
