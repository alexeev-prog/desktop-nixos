{ config, pkgs, ... }:

{
  # Включает X11
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    displayManager.gdm.wayland = true;
        desktopManager.gnome.enable = true;
  };

  services.gnome.gnome-keyring.enable = true;
    security.pam.services.greetd.enableGnomeKeyring = true;

  # Конфигурация клавиатуры в X11
  services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Включает CUPS для печати документов
  # services.printing.enable = true;

  # Включает звук
  services.pulseaudio.enable = false;
  services.pipewire = {
      enable = true;
    alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
  };

  security.rtkit.enable = true;

  # Включает поддержку тачпада (включен по умолчанию в многих desktopManager).
  services.libinput.enable = true;

  # Включение демона OpenSSH.
  services.openssh.enable = true;

  # Включение zapret
  services.zapret.enable = false;
  services.zapret.params = [
    "--dpi-desync=fake,disorder2"
    "--dpi-desync-ttl=8"
    "--dpi-desync-autottl=2"
        
    #"--dpi-desync=split2,disiorder2"
    #"--dpi-desync-ttl=1"
    #"--dpi-desync-autottl=2"
    
    # "--dpi-desync=fake"
    # "--dpi-desync-fooling=md5sig"
    # "--dpi-desync-ttl=8"
        
    # "-dpi-desync=syndata,multidisorder"
    # "--dpi-desync-split-pos=1,midsld"
        
    #"--dpi-desync=fake"
    #"--dpi-desync-ttl=8"
    #"--dpi-desync-autottl=4"
  ];

  services.zapret.whitelist = [
    "youtube.com"
    "googlevideo.com"
    "ytimg.com"
    "youtu.be"
        "1e100.net"
        "ggpht.com"
        "googleusercontent.com"
        "googlevideo.com"
        "gstatic.com"
        "gvt1.com"
        "l.google.com"
        "m.youtube.com"
        "nhacmp3youtube.com"
        "play.google.com"
        "wide-youtube.l.google.com"
        "www.youtube.com"
        "youtu.be"
        "youtube-nocookie.com"
        "youtube-studio.com"
        "youtube-ui.l.google.com"
        "youtube.be"
        "youtube.ca"
        "youtube.co"
        "youtube.co.in"
        "youtube.co.uk"
        "youtube.com"
        "youtube.com.au"
        "youtube.com.br"
        "youtube.com.mx"
        "youtube.com.tr"
        "youtube.com.ua"
        "youtube.de"
        "youtube.es"
        "youtube.fr"
        "youtube.googleapis.com"
        "youtube.jp"
        "youtube.nl"
        "youtube.pl"
        "youtube.pt"
        "youtube.ru"
        "youtubeapi.com"
        "youtubechildren.com"
        "youtubecommunity.com"
        "youtubecreators.com"
        "youtubeeducation.com"
        "youtubeembeddedplayer.googleapis.com"
        "youtubei.googleapis.com"
        "youtubekids.com"
        "yt-video-upload.l.google.com"
        "yt.be"
        "yt3.ggpht.com"
        "ytimg.com"
        "10tv.app"
        "7tv.app"
        "7tv.gg"
        "7tv.io"
        "i.ytimg.com"
        "api.7tv.app"
        "cdn.7tv.app"
        "cdn.7tv.gg"
        "emotes.7tv.app"
        "events.7tv.app"
        "static.7tv.app"
        "betterttv.net"
        "frankerfacez.com"
        "cdn.betterttv.net"
        "cdn2.frankerfacez.com"
        "cdn.frankerfacez.com"
        "api.ffzap.com"
        "api.frankerfacez.com"
  ];

  # Blueman
  services.blueman.enable = true;
  hardware.bluetooth.enable = true;

  # Enable GVfs
  services.gvfs.enable = true;

  services.flatpak.enable = true;
}
