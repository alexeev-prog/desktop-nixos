{ config, lib, pkgs, modulesPath, ... }:

{
  nixpkgs.config.allowUnfree = true;

  nixpkgs.config.permittedInsecurePackages = [
    "python-2.7.18.8"
  ];

  environment.systemPackages = with pkgs; [
  	
    firefox
    home-manager
    vim
    wget
    fastfetch
    zlib
    git
    rPackages.rmt
    # renpy
    jdk
    fragments
    rmtrash
    python311Full
    python313Full
    python313Packages.cython
    python313Packages.bpython
    python313Packages.ipython
    cpufetch
    curl
    jetbrains.rust-rover
    jetbrains.clion
    libGL
    glfw
    protonplus
    proton-caller
    wine
    xorg.libX11
    xorg.libXcursor
    xorg.libXrandr
    xorg.libXi
    cmake
    clang
    mesa
    clang-tools
    clang-tidy-sarif
    clang-analyzer
    gcc
    amberol
    lld
    pkg-config
    gdb
    valgrind
    jdk17
    jre17_minimal
    libxml2
    micro
    busybox
    nodejs
    lazygit
    lazydocker
    hexyl
    hyx
    cloc
    doxygen
    gimp-with-plugins
    mpv
    goxel
    radare2
    imhex
    rehex
    okteta
    tweak
    retext
    obs-studio
    resources
    fetchutils
    afetch
    yafetch
    cpufetch
    pkg-config
    gcc-unwrapped
    gparted
    uutils-coreutils
    bat
    libresprite
    neovim
    sublime4
    redis
    blender
    unrar
    protonplus
    protontricks
    xorg.libXext
    xorg.xorgserver
    gitoxide
    ruby
    codechecker
    dxvk
    fmt
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
    xorg.libX11
    xorg.libXtst
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
    libgccjit
    compose2nix
    pipx
    flatpak
    zapret
    colloid-icon-theme
    adw-gtk3
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
    direnv
    chromium
    blueman
    libgcc
    btop
    adwaita-qt
    adwaita-qt6
    qadwaitadecorations
    qadwaitadecorations-qt6
    vscode
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
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    departure-mono
    powerline-symbols
    nerd-fonts.jetbrains-mono
  ];

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    zlib
    stdenv.cc.cc.lib
    libgcc
  ];
}
