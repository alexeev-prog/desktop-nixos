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
    neovim
    xclip
    marble-shell-theme
    jdk17
    jre17_minimal
    iptables
    ipset
    bluez
    gnome-bluetooth
    python313FreeThreading
    gnumake
    obsidian
    openvpn3
    trashy
    gdm-settings
    ffmpeg
    cava
    zip
    unzip
    lazygit
    xwayland
    wl-clipboard
    cliphist
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
    eza
    onefetch
    python313Full
    compose2nix
    pipx
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
    zed-editor
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
    adwaita-qt
    adwaita-qt6
    qadwaitadecorations
    qadwaitadecorations-qt6
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
    pkgs.nerd-fonts.jetbrains-mono
  ];
}
