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
    # libreoffice-fresh
    pinta
    speedcrunch
    vscodium
    typora
    unrar
    python3
    discordchatexporter-desktop
    kdePackages.kdeplasma-addons
    inputs.oxide_timer.packages.${pkgs.system}.default # imports morrigan's timer, oxide
  ];
}
