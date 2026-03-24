{ inputs, config, pkgs, ... }:
{
  imports = 
    [
      ./boot.nix
      ./packages.nix
      ./stable.nix
      ./config.nix
    ]
}