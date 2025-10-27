# Tools
{ inputs, config, pkgs,  ... }:
{
  environment.systemPackages = with pkgs; [
    cargo
    gradle
    gh
    dust
    ffmpeg
    fzf
    gparted
    pipecontrol
    wine
    yt-dlp
    deno
    inkscape-with-extensions
    kapow
    libreoffice
    pinta
    speedcrunch
    vscodium
    inputs.oxide_timer.packages.${pkgs.system}.default # imports morrigan's timer, oxide
  ];
}
