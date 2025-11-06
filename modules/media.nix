# Tools
{ inputs, config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    prismlauncher
    vlc
    zathura
    ytdl-sub
    tagutil
    mgba
    dolphin-emu
    nethack
  ];

  programs.steam.enable = true;
}
