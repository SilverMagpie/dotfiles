{ inputs, config, pkgs, variables, ... }:
{
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
    
    thermald.enable = true;

    # KDE
    desktopManager.plasma6.enable = true;
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;
  };

  powerManagement.enable = true;

  programs = {
    git.config = {
      user = {
        email = "${variables.email}";
        name = "${variables.gitUsername}";
      };
    };
    
    fuse.userAllowOther = true;
    git.enable = true;
    steam.enable = true;
    mtr.enable = true;

    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  security = {
    polkit.enable = true;
    rtkit.enable = true;
  };

  # if you ever need appimages this is magic code that does magic
  boot.binfmt.registrations.appimage = {
		wrapInterpreterInShell = false;
		interpreter = "${pkgs.appimage-run}/bin/appimage-run";
		recognitionType = "magic";
		offset = 0;
		mask = ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
		magicOrExtension = ''\x7fELF....AI\x02'';
  };
}