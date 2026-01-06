# Tools
{ inputs, config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    prismlauncher
    vlc
    zathura
    ytdl-sub
    tagutil
    # snes9x-gtk
    mgba
    dolphin-emu
    vintagestory
    protonup-qt
  ];

  programs.steam.enable = true;
}
