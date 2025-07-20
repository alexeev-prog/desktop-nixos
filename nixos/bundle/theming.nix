# { config, pkgs, ... }:
# 
# {
#   # GTK Configuration for Material Palenight Theme
#   # User-level configs are handled by dotfiles in config/gtk-3.0/, config/gtk-4.0/, root_config/gtk/
# 
#   # System-wide environment variables only
# }
# nixos/bundle/theming.nix
{ config, pkgs, ... }:

{
  # GTK Configuration
  environment.systemPackages = with pkgs; [
    adw-gtk3
    colloid-icon-theme
    bibata-cursors
  ];

  environment.variables = {
    GTK_THEME = "adw-gtk3-dark";
    XCURSOR_THEME = "Bibata-Modern-Classic";
    XCURSOR_SIZE = "24";
  };

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
  };

  # Иконки и курсоры
  programs.dconf.enable = true;
  environment.etc."xdg/gtk-3.0/settings.ini".text = ''
    [Settings]
    gtk-theme-name=adw-gtk3-dark
    gtk-icon-theme-name=Colloid-dark
    gtk-font-name=JetBrains Mono 10
    gtk-cursor-theme-name=Bibata-Modern-Classic
    gtk-cursor-theme-size=24
  '';

    environment.sessionVariables = {
      # Ensure GTK applications prefer dark theme system-wide
      GTK_APPLICATION_PREFER_DARK_THEME = "1";
    };
}
