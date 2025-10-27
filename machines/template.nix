{ inputs, config, osConfig, pkgs, variables, HARDWAREGOESHERE, ... }:

{

  system.nixos.label = "${variables.hostname}";
  networking.hostName = "${variables.hostname}";
  hardware.sensor.iio.enable = true; # 2in1 specific

  imports =
    [ # Include the results of the hardware scan. TODO: map impurestyle
      ./hw-cfg-${variables.hostname}.nix
    ];
}
