{ config, lib, pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelParams = [ "psmouse.synaptics_intertouch=0" ];
  boot.initrd.verbose = true;
  boot.loader.timeout = 3;
  boot.consoleLogLevel = 0;

  boot.kernel.sysctl."net.ipv4.tcp_keepalive_time" = "60";
  boot.kernel.sysctl."net.ipv4.tcp_rmem" = "4096	1000000	16000000";
  boot.kernel.sysctl."net.ipv4.tcp_wmem" = "4096	1000000	16000000";
  boot.kernel.sysctl."net.ipv4.tcp_timestamps" = 1;
  boot.kernel.sysctl."net.ipv4.tcp_ecn" = 1;
  boot.kernel.sysctl."net.core.rmem_default" = 26214400;
  boot.kernel.sysctl."net.core.rmem_max" = 26214400;
  boot.kernel.sysctl."net.core.wmem_default" = 26214400;
  boot.kernel.sysctl."net.core.wmem_max" = 26214400;
  boot.kernel.sysctl."net.ipv4.ip_local_port_range" = "1025 65535";
  boot.kernel.sysctl."net.ipv4.tcp_congestion_control" = "bbr";
  boot.kernel.sysctl."net.core.default_qdisc" = "fq";
  boot.kernel.sysctl."net.ipv4.tcp_low_latency" = 1;
  boot.kernel.sysctl."net.ipv6.conf.all.disable_ipv6" = 1;

  boot.kernel.sysctl."vm.vfs_cache_pressure" = 50;
}
