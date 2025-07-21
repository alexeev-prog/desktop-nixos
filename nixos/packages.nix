{ config, lib, pkgs, modulesPath, ... }:

{
  nixpkgs.config.allowUnfree = true;

  nixpkgs.config.permittedInsecurePackages = [
      "python-2.7.18.8"
    ];
  
  nixpkgs.overlays = [
    (self: super: {
      renpy = super.renpy.override {
        python3 = super.python312;
      };
    })
  ];

  environment.systemPackages = with pkgs; [
 	pinta
    firefox
    nwg-look
    wofi
    xkblayout-state
    home-manager
    jq
    vim
    # qemu_full
    gtk-engine-murrine
    wget
    playerctl
    fastfetch
    xdg-utils
    tracker # Основной пакет
    tracker-miners # Индексаторы
    dconf # Для настроек
    brightnessctl
    pamixer
    appimage-run
    gtk3
    xfce.thunar
    zlib
    blueman
    brightnessctl
    bluez
    bluez-tools
    bluez-alsa
    nemo
    ffmpegthumbnailer
    gnome-music
    eog
    gnome-photos
    vlc
    totem # video player
    polkit_gnome
    gnome-keyring
    udisks
    gvfs
    cliphist
    networkmanagerapplet
    wireplumber
    pipewire
    pulseaudio
    pavucontrol
    git
    renpy
    rPackages.rmt
    jdk
    fragments
    rmtrash
    python312Full
    python313Full
    python314FreeThreading
    python313Packages.cython
    gnome-themes-extra
    colloid-icon-theme
    adwaita-icon-theme
    qgnomeplatform
    adwaita-qt
    cpufetch
    hyprland
    kitty
    swaybg
    mako
    swaylock
    grim
    slurp
    wl-clipboard
    playerctl
    swayidle
    curl
    # jetbrains.rust-rover
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
    neovim
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
    xorg.libXcursor
    xorg.libXrandr
    xorg.libXext
    freetype
    xorg.libXtst
    xorg.libXi
    xorg.libXrender
    xorg.libXxf86vm
    xorg.libX11
    xorg.libX11
    xorg.libXtst
    papers
    evince
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
    libgccjit
    libgcc
    sassc
    # jetbrains.pycharm-community-bin
    cargo
    rustc
    corefonts
    rustup
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

  security.polkit.enable = true;

  systemd.user.services.polkit-gnome-authentication-agent-1 = {
    description = "polkit-gnome-authentication-agent-1";
    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };

  users.users.alexeev.extraGroups = [ "storage" ];

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
    iosevka
    nerd-fonts.iosevka
  ];

  # environment.extraSetup = ''
  #   export XDG_CONFIG_HOME=/etc/dummy-conf
  #   ${pkgs.glib}/bin/gsettings set org.freedesktop.Tracker3.Miner.Files index-single-directories "['&DESKTOP', '&DOCUMENTS']"
  #   ${pkgs.glib}/bin/gsettings set org.freedesktop.Tracker3.Miner.Files index-recursive-directories "['&DOWNLOAD', '&MUSIC', '&PICTURES', '&VIDEOS']"
  #   unset XDG_CONFIG_HOME
  # '';

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    zlib
    stdenv.cc.cc.lib
    libgcc
  ];
}
