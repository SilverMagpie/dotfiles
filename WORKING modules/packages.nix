{ inputs, config, pkgs, variables, ... }:
{
  environment.systemPackages = with pkgs;
  [
  ];

  fonts.packages = with pkgs;
  [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    nerd-fonts.shure-tech-mono
    nerd-fonts.fira-code
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    garamond-libre
  ];

  programs = {
    git.config = {
      user = {
        email = "${variables.email}";
        name = "${variables.gitUsername}";
      };
    };
    steam.enable = true;
    mtr.enable = true;
  };

  nixpkgs.config.permittedInsecurePackages = [
    "electron-38.8.4"
  ];
}