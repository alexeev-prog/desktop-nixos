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
	# hardware.pulseaudio.enable = true;
	# Или
	services.pipewire = {
		enable = true;
		pulse.enable = true;
	};

	# Включает поддержку тачпада (включен по умолчанию в многих desktopManager).
	services.libinput.enable = true;

	# Включение демона OpenSSH.
	services.openssh.enable = true;

	# Включение zapret
	services.zapret.enable = true;
	services.zapret.params = [
		"--dpi-desync=fake,disorder2"
		"--dpi-desync-ttl=1"
		"--dpi-desync-autottl=2"
	];
}
