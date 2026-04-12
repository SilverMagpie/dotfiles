## Pulls packages specifically from stable repo, rather than the default unstable.

{ inputs, config, pkgs, ... }:
{
  environment.systemPackages = with inputs.nixpkgs-stable.legacyPackages.${pkgs.system}; [
    mullvad-vpn
    libreoffice
    vesktop
  ];
}
