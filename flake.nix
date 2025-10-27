{
  description = "Morgan Mayday's config, version 1.0.0-unstable";

  inputs = {
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixpkgs.url = "nixpkgs/nixos-unstable";
    oxide_timer = { # morrigan's timer
      url = "path:./modules/oxide_timer";
      flake = true;
    };
  };

  outputs = { self, nixpkgs, nixos-hardware, ... }@inputs:
  let
    variables = {
      username = "sophia";
      hostname = "aperion";
      # hardware = "framework-12-13th-gen-intel";
      email = "sophie.markwell@protonmail.com";
      gitUsername = "SilverMagpie";
      userDescription = "Sophia Elona";
      editor = "nvim"; # I know it slightly more than nano lol
    };
  in
  {
    nixosConfigurations.${variables.hostname} = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs variables; };
      modules = [
        ./index.nix
#         ./machines/${variables.hostname}.nix
#         ./modules/index.nix
#        nixos-hardware.nixosModules.${variables.hardware}
      ];
    };
  };
}
