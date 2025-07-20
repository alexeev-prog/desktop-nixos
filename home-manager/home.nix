# home-manager/home.nix
{
  imports = [
    ./modules/bundle.nix
  ];

  programs.home-manager.enable = true;

  home = {
    username = "alexeev";
    homeDirectory = "/home/alexeev";
    stateVersion = "24.11";
  };

#   gtk = {
#     enable = true;
#     theme = {
#       name = "Adwaita-dark";
#       package = pkgs.gnome-themes-extra;
#     };
#     iconTheme = {
#       name = "Colloid-dark";
#       package = pkgs.colloid-icon-theme.override { color = "dark"; };
#     };
#     cursorTheme = {
#       name = "Adwaita";
#       package = pkgs.adwaita-icon-theme;
#       size = 24;
#     };
#   };
# 
#   # Qt тема
#   qt = {
#     enable = true;
#     platformTheme = "gnome";
#     style.name = "adwaita-dark";
#   };
# 
#   # Настройки окружения
#   home.sessionVariables = {
#     GTK_THEME = "Adwaita-dark";
#     QT_STYLE_OVERRIDE = "adwaita-dark";
#     XCURSOR_THEME = "Adwaita";
#     XCURSOR_SIZE = "24";
#   };
}	
