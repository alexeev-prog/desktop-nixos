{ config, pkgs, ... }:

{
  # GTK Configuration for Material Palenight Theme
  # User-level configs are handled by dotfiles in config/gtk-3.0/, config/gtk-4.0/, root_config/gtk/

  # System-wide environment variables only
  environment.sessionVariables = {
    # Ensure GTK applications prefer dark theme system-wide
    GTK_APPLICATION_PREFER_DARK_THEME = "1";
  };
}
