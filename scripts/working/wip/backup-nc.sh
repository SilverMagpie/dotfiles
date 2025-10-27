#!/usr/bin/env bash
# Pass the target directory to this script as the first and only argument. If it has spaces, like /etc/media/Store n Go/Backup, surround it with "quotes"
# Specifically designed to work around fucking Vesktop
# WIP
echo ""

nano $HOME/dotfiles/scripts/depend/backup-targets.txt
nano $HOME/dotfiles/scripts/depend/nocache-targets.txt
indexedTargets=$(cat $HOME/dotfiles/scripts/depend/backup-targets.txt)
badCache=$(cat $HOME/dotfiles/scripts/depend/nocache-targets.txt)

for i in ${indexedTargets[@]}; do
    if ! [[ -e $i ]]; then
       echo "Missing $i from backup-nc-targets.txt, skipping"
    else
      cd $i
      credit=$(ls)

      cp --preserve=all -v $i "$1"
      echo "Copied $i to $1"
   fi
done

echo ""
