{ config, pkgs, ... }:

{
  programs.swaylock = {
    enable = true;
    settings = {
      color = "1a1a1a";
      font = "JetBrains Mono";
      show-failed-attempts = true;
      indicator = true;
      indicator-radius = 100;
      indicator-thickness = 10;
      line-color = "58a6ff";
      ring-color = "303241";
      inside-color = "1a1a1a";
      key-hl-color = "58a6ff";
      separator-color = "00000000";
      text-color = "c9d1d9";
      text-caps-lock-color = "";
      line-ver-color = "58a6ff";
      ring-ver-color = "303241";
      inside-ver-color = "1a1a1a";
      text-ver-color = "c9d1d9";
      ring-wrong-color = "e06c75";
      text-wrong-color = "e06c75";
      inside-wrong-color = "1a1a1a";
      line-wrong-color = "e06c75";
      bs-hl-color = "e06c75";
      grace = 2;
    };
  };
}
