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

  # Включаем GTK и Qt темирование
  gtk.enable = true;
  gtk.theme.name = "Adw-gtk3-dark";
  gtk.iconTheme.name = "Colloid";

  qt.enable = true;
  qt.platformTheme = "gtk";
}
