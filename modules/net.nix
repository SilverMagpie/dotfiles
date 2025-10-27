{ inputs, config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    firefox
    tor-browser
    # hugo
    signal-desktop
    # signal-cli
    vesktop
    # discordchatexporter-cli
    # discordo
	mullvad-vpn
    networkmanager
  ];

  networking = {
    networkmanager = {
      enable = true;
    };
    nameservers = [ "9.9.9.9" ];
    enableIPv6 = false;
    nat = {
      enable = true;
      internalInterfaces = [ "ve-+" ];
      externalInterface = "wlan0";
    };
    firewall = {
      enable = true;
      # open ports in firewall below
        # allowedTCPPorts = [ ... ];
        # allowedUDPPorts = [ ... ];
  };
};
  services.avahi = { # LAN discovery
          enable = true;
          nssmdns4 = true;
          openFirewall = true;
      };
  services.mullvad-vpn.enable = true;
  services.blueman.enable = false; # bluetooth, change to true if needed
  hardware.bluetooth.enable = false; # bluetooth, change to true if needed
  hardware.bluetooth.powerOnBoot = false; # bluetooth on boot
  services.printing = {
          enable = true;
          drivers = [ pkgs.gutenprint pkgs.hplip];
      };
  programs.mtr.enable = true; # network diagnostics tool

}
