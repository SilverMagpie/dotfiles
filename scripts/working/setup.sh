#!/usr/bin/env bash
# Spaghetti so dense you could bounce a dime off it
if [[ $* =~ h ]]; then
    echo "=== Valid arguments ===" && echo "" && echo "h:  Show this help." && echo "v:  Verbose mode." && echo "r:  Rebuild and reboot." && echo "g:  Skip git pull."
else
if ! [[ $* =~ g ]]; then
    echo "Testing for git install..."
    if ! command -v git
    then
        echo "Git not installed. Using nix-shell to temporarily install git..."
        nix-shell -p git --command "cd $HOME && git clone https://github.com/morganmayday/dotfiles.git || echo 'Remove $HOME/dotfiles and try again'"
        exit 1
    elif command -v git
    then
        echo "Git found, pulling now." && cd $HOME && git clone https://github.com/morganmayday/dotfiles.git || echo 'Remove $HOME/dotfiles and try again.' && exit 1
    fi
fi
vAutomanaging="Automanaging "
managedCount=0
looseFileCount=0
looseFolderCount=0
if [[ $* =~ v ]]; then
    verbose=true
    vDirMan=" in $HOME/dotfiles/setup/managed"
    vDirLoose=" in $HOME/dotfiles/setup/loose"
    vHypr=" $HOME/.config/hypr/hyprland.conf to"
    vMako=" $HOME/.config/mako/config to"
    vAutomanaging="Overwriting preexisting config folders with provided folders: "
    vGTKDir=" in $HOME/local/share/themes"
    vGTKIDir=" in $HOME/local/share/icons"
fi
if [[ $* =~ r ]]; then
    skipRebuild=false
fi
echo "" && echo "" && echo "==== MAYDAY NIX SETUP SCRIPT V2.0 ====" && echo "      Written by Morgan Mayday" && echo "" && echo "Initializing..." && echo ""
cd $HOME

managed=`ls $HOME/dotfiles/setup/managed`
managedCount=`ls -d $HOME/dotfiles/setup/managed/* | wc -l`
loose=`ls -p $HOME/dotfiles/setup/loose`
looseFileCount=`ls -d -p $HOME/dotfiles/setup/loose/* | grep -v '/$' | wc -l`
looseFolderCount=`ls -d -p $HOME/dotfiles/setup/loose/* | grep '/$' | wc -l`
echo "$vAutomanaging$managedCount folders$vDirMan"
echo -n "[   "
for i in $managed
do
    cp -r -f $HOME/dotfiles/setup/managed/$i $HOME/.config/$i && echo -n "$i "
done
echo "  ]" && echo "Written!" && echo ""
echo "source = $HOME/dotfiles/hypr/index.conf" > "$HOME/.config/hypr/hyprland.conf" && echo "Linked$vHypr $HOME/dotfiles/hypr/index.conf"
echo "include=config $HOME/dotfiles/hypr/mako" > "$HOME/.config/mako/config" && echo "Linked$vMako $HOME/dotfiles/hypr/mako"

echo "" && echo "$looseFolderCount folders $looseFileCount files loose, examine manually post-install."
if [[ $verbose = true ]]; then
    echo "Loose:"
    for i in $loose
    do
        echo "  $i"
    done
fi
echo "" && echo -n "Installing GTK theme$vGTKDir" && cp -r -f $HOME/dotfiles/setup/theme/ClassicPlatinumStreamlined $HOME/.local/share/themes && echo "...success"
echo -n "Installing GTK icons$vGTKIDir" && cp -r -f $HOME/dotfiles/setup/theme/RetroismIcons $HOME/.local/share/icons && echo "...success"
echo "" && echo "All operations completed. Safe to rebuild and reboot."
if [[ $skipRebuild = false ]]; then
    echo "Prompting password for rebuild and reboot..."
    sudo nixos-rebuild switch --impure --flake $HOME/dotfiles#atlas && reboot
fi
fi
