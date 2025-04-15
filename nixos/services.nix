{ config, pkgs, ... }:

{
	# Включает X11
	services.xserver = {
		enable = true;
		displayManager.gdm.enable = true;
		desktopManager.gnome.enable = true;
	};

	# Конфигурация клавиатуры в X11
	services.xserver.xkb.layout = "us";
	# services.xserver.xkb.options = "eurosign:e,caps:escape";

	# Включает CUPS для печати документов
	# services.printing.enable = true;

	# Включает звук
	hardware.pulseaudio.enable = false;
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

	services.getty.autologinUser = "alexeev";
}
