{ inputs, config, pkgs, variables, ... }:
{
    environment.sessionVariables = {
        NIXOS_OZONE_WL = "1"; # fixes some electron stuff
        ELECTRON_OZONE_PLATFORM_HINT = "auto";
        DOTFILES_DIR = "/home/${variables.username}/dotfiles";
        SCRIPTS_DIR = "/home/${variables.username}/dotfiles/scripts";
        SCRIPTS_PATH = "/home/${variables.username}/dotfiles/scripts/stable";
        PATH="\${SCRIPTS_PATH}:\${PATH}";
        EDITOR="${variables.editor}";
    };
    programs.git.config = {
        user = {
            email = "${variables.email}";
            name = "${variables.gitUsername}";
        };
        core = {
            pager = "cat";
            editor = "${variables.editor}";
        };
   };
    time.timeZone = "US/Pacific";
    i18n.defaultLocale = "en_US.UTF-8";

    nixpkgs.config.permittedInsecurePackages = [
    "electron-38.8.4"
    ];

}
