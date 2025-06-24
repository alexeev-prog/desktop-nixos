# Измените этот конфиг для добавления что-то в вашу NixOS-систему

{ config, lib, pkgs, ... }:

{
	imports =
	[ # Включите результаты сканирования железа
		./hardware-configuration.nix
		./packages.nix
		./services.nix
		./bundle/bundle.nix
	];
	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	networking.hostName = "nixos"; # Ваше имя хоста
	
	# Выберите один из методов подключения.
	# networking.wireless.enable = true;    # Включает беспроводное подключение через wpa_supplicant.
	networking.networkmanager.enable = true;    # Простейший способ

	# Временная зона
	time.timeZone = "Asia/Novosibirsk";

	# Конфигурация прокси-сервера
	# networking.proxy.default = "http://user:password@proxy:port/";
	# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

	# Свойства перевода и интернационализации
	# i18n.defaultLocale = "en_US.UTF-8";
	# console = {
	#     font = "Lat2-Terminus16";
	#     keyMap = "us";
	#     useXkbConfig = true; # использовать xkb options в tty
	# };

	# Аккаунт пользователя
	users.users.alexeev = {
		isNormalUser = true;
		initialPassword = "bEst7777";
		shell = pkgs.fish;
		extraGroups = [ "wheel" ];
	};

	# Some programs need SUID wrappers, can be configured further or are
	# started in user sessions.
	# programs.mtr.enable = true;
	# programs.gnupg.agent = {
	#     enable = true;
	#     enableSSHSupport = true;
	# };

	# Открытие портов в фаерволле
	# networking.firewall.allowedTCPPorts = [ ... ];
	# networking.firewall.allowedUDPPorts = [ ... ];
	# Или выключите фаерволл в целом.
	# networking.firewall.enable = false;

	# Скопируйте файл конфигурации NixOS и свяжите его с полученной системой
	# (/run/current-system/configuration.nix). Это полезно если
	# вы случайно удалили configuration.nix
	# system.copySystemConfiguration = true;

	# Этот параметр определяет первую версию NixOS, установленную на данном компьютере,
	# и используется для обеспечения совместимости с данными приложений (например, базами данных), созданными на более старых версиях NixOS.
	#
	# Большинству пользователей ни в коем случае не следует изменять это значение после первоначальной установки,
	# даже если вы обновили свою систему до новой версии NixOS.
	# Это значение не влияет на версию Nixpkgs, из которой извлекаются ваши пакеты и ОС,
	# поэтому его изменение не приведет к обновлению вашей системы - смотрите раздел https://nixos.org/manual/nixos/stable/#sec-upgrading как
	# это сделать на самом деле.
	#
	# Если это значение ниже текущей версии NixOS, это не означает, что ваша система обновлена.
	# устарело, не поддерживается или уязвимо.
	#
	# НЕ меняйте это значение, если вы вручную не проверили все изменения, которые оно может внести в вашу конфигурацию,
	# и не перенесли свои данные соответствующим образом.
	#
	# Дополнительные сведения см. в разделе "man configuration.nix` или https://nixos.org/manual/nixos/stable/o
	system.stateVersion = "24.11"; # Вы прочитали комментарий?

	nixpkgs.config.permittedInsecurePackages = [
      "openssl-1.1.1w"
    ];
}

