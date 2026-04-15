{ inputs, config, pkgs, variables, ... }:
{
  environment.systemPackages = with pkgs; [
    ### WORKFLOW-CLI ###
    fastfetch
    neovim
    neovide
    nano
    bash
    bashly
    bc
    gh
    vim

    ### WORKFLOW-GUI ###
    speedcrunch
    protonup-qt
    gparted

    ### UTILS ###
    mullvad-vpn
    wget
    unzip
    zip
    unrar
    tagutil
    discordchatexporter-desktop
    dust
    fzf

    ### WORKFLOW ###
    # libreoffice - stable branch
    vscodium
    typora
    obsidian
    inkscape-with-extensions
    pinta
    git
    python315
    # deno # JavaScript
    # cargo # Rust
    # gradle # Java

    ### COMMUNICATION ###
    # Vesktop - stable branch
    stoat-desktop
    signal-desktop

    ### MEDIA ###
    vlc
    yt-dlp
    ytdl-sub
    firefox
    ffmpeg

    ### GAMING ###
    wine
    prismlauncher
    vintagestory
    mgba
    dolphin-emu
    # cemu
    (olympus.override { celesteWrapper = "steam-run"; })

    ### FIRMWARE ###
    linux-firmware
    fwupd
    networkmanager
    dbus
    pipewire
    pipecontrol

    ### KDE ###
    kdePackages.kate
    kdePackages.kcharselect # Tool to select and copy special characters from all installed fonts
    kdePackages.kclock # Clock app
    kdePackages.kcolorchooser # A small utility to select a color
    kdePackages.kolourpaint # Easy-to-use paint program
    kdePackages.ksystemlog # KDE SystemLog Application
    kdePackages.sddm-kcm # Configuration module for SDDM
    kdiff3 # Compares and merges 2 or 3 files or directories
    hardinfo2 # System information and benchmarks for Linux systems
    wayland-utils # Wayland utilities
    wl-clipboard # Command-line copy/paste utilities for Wayland
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "electron-38.8.4"
  ];

  environment.plasma6.excludePackages = with pkgs; [
    kdePackages.elisa # Simple music player aiming to provide a nice experience for its users
    kdePackages.kdepim-runtime # Akonadi agents and resources
    kdePackages.kmahjongg # KMahjongg is a tile matching game for one or two players
    kdePackages.kmines # KMines is the classic Minesweeper game
    kdePackages.konversation # User-friendly and fully-featured IRC client
    kdePackages.kpat # KPatience offers a selection of solitaire card games
    kdePackages.ksudoku # KSudoku is a logic-based symbol placement puzzle
    kdePackages.ktorrent # Powerful BitTorrent client
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    nerd-fonts.shure-tech-mono
    nerd-fonts.fira-code
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    garamond-libre
  ];
}
