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
{

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

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
    GDK_BACKEND = "wayland";
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
  };
}
