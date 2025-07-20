{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    displayManager.gdm.wayland = true;
  };

  services.gnome.gnome-keyring.enable = true;
  security.pam.services.greetd.enableGnomeKeyring = true;


  # Конфигурация клавиатуры в X11
  # services.xserver.xkb.layout = "us";
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
    jack.enable = true;
  };

  security.rtkit.enable = true;

  # Включает поддержку тачпада (включен по умолчанию в многих desktopManager).
  services.libinput.enable = true;

  # Включение демона OpenSSH.
  services.openssh.enable = true;

  # Включение zapret
  services.zapret.enable = true;
  services.zapret.params = [
      # "--dpi-desync=fake,disorder2"
      # "--dpi-desync-ttl=8"
      # "--dpi-desync-autottl=2"
          
      # "--dpi-desync=split2,disorder2"
      # "--dpi-desync-ttl=1"
      # "--dpi-desync-autottl=2"
      
      # "--dpi-desync=fake"
      # "--dpi-desync-fooling=md5sig"
      # "--dpi-desync-ttl=8"
          
      "-dpi-desync=syndata,multidisorder"
      "--dpi-desync-split-pos=1,midsld"
          
      # "--dpi-desync=fake"
      # "--dpi-desync-ttl=8"
      # "--dpi-desync-autottl=4"
    ];
  # Blueman
  services.blueman.enable = true;
  hardware.bluetooth.enable = true;

  # Enable GVfs
  services.gvfs.enable = true;

  services.flatpak.enable = true;

  virtualisation.docker.enable = true;

  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  services.tumbler.enable = true; # сервис миниатюр
    environment.systemPackages = with pkgs; [
      tumbler # для миниатюр изображений
      poppler_utils # миниатюры PDF
    ];
  
    # Поддержка форматов
    services.tumbler.extraPlugins = with pkgs; [
      tumbler # основной плагин
      ffmpegthumbnailer
    ];
}
