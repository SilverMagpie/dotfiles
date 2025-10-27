{ inputs, config, pkgs, variables, ... }:
{
#  nix.package = pkgs.lix;
  imports =
    [
      ./${variables.hostname}.nix
    ];
}
