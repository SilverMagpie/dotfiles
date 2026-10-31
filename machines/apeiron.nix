{ inputs, config, osConfig, pkgs, variables, ... }:

{

  system.nixos.label = "${variables.hostname}";
  networking.hostName = "${variables.hostname}";

  imports =
    [ # if this map-impure doesn't work, copy the below file into this folder, and point the path here
      /etc/nixos/hardware-configuration.nix
    ];
}
