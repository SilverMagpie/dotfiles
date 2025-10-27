#!/usr/bin/env bash
# Pass artist as argument I think. Didn't comment my code well enough last time

cd $HOME/Media/Music
dumped=$(cat $HOME/dotfiles/scripts/depend/dumped.txt)
for artist in *; do
   if [[ $artist != "Fresh" ]]; then
      echo "$artist"
      cd $artist
      for album in *; do
         echo "$album"
         cd $album
         for song in *; do
            fullpath=$(realpath $song)
            if ! [[ $dumped =~ $fullpath ]]; then
               cp $fullpath $HOME/Media/allmusic/$song
               echo $fullpath >> $HOME/dotfiles/scripts/depend/dumped.txt
            fi
         done
         cd ..
      done
      cd ..
   fi
done
