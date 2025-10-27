{ inputs, config, pkgs, variables, ... }:
{
  environment.systemPackages = with pkgs;
  [
    bash
    bc
    bashly
    git
    linux-firmware
    kitty
    nano
    neovim
    neovide
    fastfetch # replacing neofetch
    pipewire
    wget
    unzip
    zip
	kdePackages.kate
	nemo-with-extensions
	nemo-fileroller
	nemo-preview
  ];
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
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

  hardware.graphics.enable = true;

  services = {
    # Automatically mount removable media to /media
    udisks2.enable = true;
    udisks2.mountOnMedia = true;
    # Schedulers
    cron.enable = true;
    atd.enable = true;
    # Not certain if this one is necessary, it gens thumbnails
    tumbler.enable = true;
    # Power stuff
    upower.enable = true;
    logind.settings.Login = {
      HandleLidSwitch = "suspend-then-hibernate";
      HandlePowerKey = "poweroff";
    };
    # Other stuff
    envfs.enable = true;
    flatpak.enable = true;
    gvfs.enable = true;
    pipewire = {
		enable = true;
		audio.enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
		jack.enable = true;
		wireplumber.enable = true;
	};
	locate = {
		enable = true;
		package = pkgs.plocate;
	};
	xserver = {
      enable = true;
      xkb.layout = "us";
      xkb.variant = "";
    };
  };

  programs.fuse.userAllowOther = true;
  programs.git.enable = true;
  powerManagement.enable = true;

  # if you ever need appimages this is magic code that does magic
  boot.binfmt.registrations.appimage = {
		wrapInterpreterInShell = false;
		interpreter = "${pkgs.appimage-run}/bin/appimage-run";
		recognitionType = "magic";
		offset = 0;
		mask = ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
		magicOrExtension = ''\x7fELF....AI\x02'';
  };

  security.polkit.enable = true;
  services.thermald.enable = true; # temp manager, likely unnecessary but better safe than sorry
  security.rtkit.enable = true; # realtime scheduling for user processes, needed for pipewire
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

}
