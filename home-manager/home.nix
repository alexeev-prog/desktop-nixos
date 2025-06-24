{

  imports = [
    ./modules/bundle.nix
    <catppuccin/modules/home-manager>
  ];
  programs.home-manager.enable = true;
  catppuccin.flavor = "mocha";
  catppuccin.enable = true;

  home = {
    username = "alexeev";
    homeDirectory = "/home/alexeev";
    stateVersion = "24.11";
  };
}
