{ inputs, config, pkgs, variables, ... }:
{
  environment.systemPackages = with pkgs;
  [
    fwupd
    dbus
	# tuigreet
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  services.fwupd.enable = true;

#  services.greetd = {
#    enable = true;
#    useTextGreeter = true;
#    settings = {
#      default_session = {
#        command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --remember-session --asterisks --theme 'container=darkgray;border=yellow;text=cyan;time=cyan;input=yellow;prompt=cyan;action=cyan' --cmd hyprland --greeting 'Good morning, Morgan.' --greet-align center";
#        user = "greeter";
#      };
#    };
#  };

}
