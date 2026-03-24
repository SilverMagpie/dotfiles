{ inputs, config, pkgs, ... }:
{
imports =
    [
      ./base.nix
      ./boot.nix
      ./plasma.nix
      ./tools.nix
      ./media.nix
      ./net.nix
      ./vars.nix
      ./stable.nix
    ];
}
