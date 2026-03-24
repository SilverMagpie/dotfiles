{ inputs, config, pkgs, ... }:
{
  imports = 
    [
      ./boot.nix
      ./config.nix
      ./net.nix
      ./packages.nix
      ./stable.nix
      ./vars.nix
    ]
}