{ config, lib, pkgs, modulesPath, ... }:

{
    nixpkgs.config.allowUnfree = true;
    environment.systemPackages = with pkgs; [
        vim
        wget
        fastfetch
        git
        curl
        micro
        neovim
        xclip
        marble-shell-theme
        papirus-icon-theme
        iptables
        ipset
        orchis-theme
        capitaine-cursors
        jetbrains-mono
        iosevka
        openssh
        clang
        openblas
        gcc
        htop
        go
        nasm
        fasm
        zoxide
        fzf
        gnome.gvfs
        libz
        zlib
        fish
        libstdcxx5
        python313Full
        poetry
        flatpak
        zapret
        adw-gtk3
        elementary-xfce-icon-theme
        font-awesome_5
        telegram-desktop
        uv
        docker
        gnome-tweaks
        libgccjit
        vscodium
        libgcc
        gnome-console
        jetbrains.pycharm-community-bin
        cargo
        rustc
        corefonts
        rustup
        rustfmt
        chromium
        btop
    ];

    programs.fish.enable = true;

    programs.neovim = {
        enable = true;
        defaultEditor = true;
    };

    services.zapret.enable = true;
    services.zapret.params = [
    "--dpi-desync=fake,disorder2"
    "--dpi-desync-ttl=1"
    "--dpi-desync-autottl=2"
    ];

    fonts.packages = with pkgs; [
        (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];
}
