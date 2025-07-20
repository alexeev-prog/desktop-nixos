{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.wofi;

in {
    options.modules.wofi = { enable = mkEnableOption "wofi"; };
    config = mkIf cfg.enable {
      home.file.".config/wofi/config".text = ''
        show=drun
        allow_images=true
        image_size=24
        insensitive=true
        prompt=Search...
        style=${./wofi.css}
      '';
      home.file.".config/wofi/style.css".source = ./wofi.css;
    };
}
