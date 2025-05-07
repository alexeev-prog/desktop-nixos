{ config, lib, pkgs, modulesPath, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    home-manager
    vim
    wget
    fastfetch
    zlib
    git
    curl
    micro
    busybox
    pkg-config
    gcc-unwrapped
    gparted
    uutils-coreutils
    bat
    neovim
    sublime
    redis
    xorg.libXext
    xorg.xorgserver
    gitoxide
    ruby
    codechecker
    mongodb-ce
    fmt
    libclang
    xclip
    marble-shell-theme
    xorg.libXcursor
    xorg.libXrandr
    xorg.libXext
    freetype
    qemu_full
    xorg.libXtst
    xorg.libXi
    xorg.libXrender
    xorg.libXxf86vm
    xorg.libX11
    jdk17
    jre17_minimal
    xorg.libX11
    xorg.libXtst
    mongodb-compass
    papers
    evince
    qemu_full
    notify-desktop
    libnotify
    arp-scan
    iptables
    ipset
    bluez
    gnome-bluetooth
    python313FreeThreading
    gnumake
    obsidian
    openvpn
    sqlitebrowser
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
    openblas
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
    libgccjit
    compose2nix
    pipx
    flatpak
    zapret
    colloid-icon-theme
    adw-gtk3
    elementary-xfce-icon-theme
    font-awesome_5
    telegram-desktop
    ruff
    black
    uv
    docker
    nitch
    gnome-tweaks
    libgccjit
    vscodium
    libgcc
    gnome-terminal
    sassc
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
    libgcc
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

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam"
    "steam-original"
    "steam-unwrapped"
    "steam-run"
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
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

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    zlib # numpy
    # libgccjit
    stdenv.cc.cc.lib
    libgcc  # sqlalchemy
    # that's where the shared libs go, you can find which one you need using 
    # nix-locate --top-level libstdc++.so.6  (replace this with your lib)
    # ^ this requires `nix-index` pkg
  ];
}
