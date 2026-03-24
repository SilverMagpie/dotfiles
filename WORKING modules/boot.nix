## Controls the bootloader

{ inputs, config, pkgs, variables, ... }:
{
  # Enables systemd-boot
  boot.loader.systemd-boot.enable = true;
  # Allows the bootloader to touch things in UEFI and such
  boot.loader.efi.canTouchEfiVariables = true;
  # Allows the firmware updater to work
  services.fwupd.enable = true;

  # Controls the TUI greeter
  # Disabled for now
  # services.greetd = {
  #   enable = true;
  #   useTextGreeter = true;
  #   settings = {
  #     default_session = {
  #       command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --remember-session --asterisks --theme 'container=darkgray;border=white;text=cyan;time=cyan;input=white;prompt=cyan;action=cyan' --cmd start-hyprland --greeting 'Good morning, Ms. Morgan.' --greet-align center";
  #       user = "greeter";
  #     };
  #   };
  # };

}
