{ inputs, config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
		kdePackages.kcharselect # Tool to select and copy special characters from all installed fonts
		kdePackages.kclock # Clock app
		kdePackages.kcolorchooser # A small utility to select a color
		kdePackages.kolourpaint # Easy-to-use paint program
		kdePackages.ksystemlog # KDE SystemLog Application
		kdePackages.sddm-kcm # Configuration module for SDDM
		kdiff3 # Compares and merges 2 or 3 files or directories
		kdePackages.partitionmanager # Optional: Manage the disk devices, partitions and file systems on your computer
		hardinfo2 # System information and benchmarks for Linux systems
		wayland-utils # Wayland utilities
		wl-clipboard # Command-line copy/paste utilities for Wayland
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
	services = {
  		desktopManager.plasma6.enable = true;

  		displayManager.sddm.enable = true;

  		displayManager.sddm.wayland.enable = true;
	};
}
