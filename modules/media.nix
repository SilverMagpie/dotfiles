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
  ];

  programs.steam.enable = true;
}
