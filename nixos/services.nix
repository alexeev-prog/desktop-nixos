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
	services.zapret.enable = true;
	services.zapret.params = [
		"--dpi-desync=fake,disorder"
		"--dpi-desync-fooling=md5sig"
		"-dpi-desync=split2"
	];

	services.zapret.whitelist = [
    "youtube.com"
    "googlevideo.com"
    "ytimg.com"
    "youtu.be"
  ];

	# Blueman
	services.blueman.enable = true;
	hardware.bluetooth.enable = true;

	# Enable GVfs
  services.gvfs.enable = true;
}
