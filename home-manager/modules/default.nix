{ config, pkgs, ... }:

{
  xdg.mime.enable = true;
  xdg.mime.defaultApplications = {
    "inode/directory" = "thunar.desktop";
  };
}
