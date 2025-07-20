# nixos/bundle/theming.nix
{ config, pkgs, ... }:

{
  # GTK Configuration
  environment.systemPackages = with pkgs; [
    adw-gtk3
    colloid-icon-theme
  ];

  xdg.mime.defaultApplications = {
    "inode/directory" = "nemo.desktop";
    "image/*" = "eog.desktop";
    "video/*" = "mpv.desktop";
  };

  environment.variables = {
    GTK_THEME = "adw-gtk3-dark";
    GTK_USE_PORTAL = "1"
    # XCURSOR_THEME = "Bibata-Modern-Classic";
    XCURSOR_SIZE = "24";
  };

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
  };

  programs.dconf.enable = true;
  environment.etc = {
    "xdg/gtk-3.0/settings.ini".text = ''
      [Settings]
      gtk-theme-name=adw-gtk3-dark
      gtk-icon-theme-name=Colloid-dark
      gtk-font-name=JetBrains Mono 10
      gtk-cursor-theme-size=24
      gtk-application-prefer-dark-theme=1
    '';
    
    "xdg/gtk-4.0/settings.ini".text = ''
      [Settings]
      gtk-theme-name=adw-gtk3-dark
      gtk-icon-theme-name=Colloid-dark
      gtk-font-name=JetBrains Mono 10
      gtk-cursor-theme-size=24
      gtk-application-prefer-dark-theme=1
    '';
  };

  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      jetbrains-mono
      noto-fonts
      noto-fonts-emoji
      font-awesome
    ];
    fontconfig = {
      defaultFonts = {
        monospace = [ "JetBrains Mono" ];
        sansSerif = [ "Noto Sans" ];
        serif = [ "Noto Serif" ];
      };
    };
  };
}
