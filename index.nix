{ inputs, outputs, lib, config, pkgs, variables, ... }:
{

  system.stateVersion = "25.05";

  imports = [
    ./modules/index.nix
    ./machines/index.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in {

    settings = {
      experimental-features = ["nix-command flakes"];
    };

    gc = { # garbage collection
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
      };
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  users.users = {
     ${variables.username} = {
        isNormalUser = true;
        extraGroups = [ "networkmanager" "wheel" "wireshark" ];
        shell = pkgs.bash;
        description= "${variables.userDescription}";
    };
  };
}
