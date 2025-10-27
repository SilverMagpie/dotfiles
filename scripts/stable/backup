#!/usr/bin/env bash
# Pass the target directory to this script as the first and only argument. If it has spaces, like /etc/media/Store n Go/Backup, surround it with "quotes"
echo ""

nano $HOME/dotfiles/scripts/depend/backup-targets.txt
indexedTargets=$(cat $HOME/dotfiles/scripts/depend/backup-targets.txt)

for i in ${indexedTargets[@]}; do
    if ! [[ -e $i ]]; then
       echo "Missing $i from backup-targets.txt, skipping"
    else
      cp --preserve=all -v -r $i "$1"
      echo "Copied $i to $1"
   fi
done

echo ""
