{ config, lib, pkgs, modulesPath, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    home-manager
    vim
    wget
    fastfetch
    git
    curl
    micro
    gparted
    obsidian
    polymc
    neovim
    xclip
    marble-shell-theme
    papirus-icon-theme
    iptables
    ipset
    orchis-theme
    capitaine-cursors
    gnumake
    ffmpeg
    cava
    zip
    unzip
    lazygit
    xwayland
    wl-clipboard
    cliphist
    papirus-nord
    jetbrains-mono
    iosevka
    openssh
    clang
    openblas
    gcc
    htop
    go
    onlyoffice-desktopeditors
    nasm
    fasm
    zoxide
    fzf
    gnome.gvfs
    libz
    zlib
    fish
    libstdcxx5
    eza
    onefetch
    python313Full
    compose2nix
    poetry
    flatpak
    zapret
    adw-gtk3
    elementary-xfce-icon-theme
    font-awesome_5
    telegram-desktop
    ruff
    black
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
    alacritty-theme
    alacritty
    dust
    nitch
    ranger
    feh
    zram-generator
    rustfmt
    chromium
    blueman
    btop
  ];

  programs.fish.enable = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];
}
