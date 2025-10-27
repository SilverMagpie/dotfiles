#!/usr/bin/env bash
# Pass artist as argument I think. Didn't comment my code well enough last time

echo ""

function updateTitles {
   for eachfile in *; do
      if [[ $eachfile =~ [^a-zA-Z0-9\.\(\)\_\-] ]]; then
         mv "$eachfile" "${eachfile//[^a-zA-Z0-9\.\(\)\-\_]/_}"
         echo "Moved $eachfile to ${eachfile//[^a-zA-Z0-9\.\(\)\-\_]/_}"
      fi
   done
}

if [[ $1 == "h" ]]; then
   echo "=== Valid options ===" && echo "" && echo "h:  Show this help." && echo "m:  Manually assign track numbers. Defaults to 0 without this option."
else

cd $HOME/Media/Music
updateTitles
indexLibrary=$(ls)
echo "=== Artists found: ===" && echo "${indexLibrary//_/ }" && echo ""

for indexed in *; do
   if [[ $indexed != "Fresh" ]]; then
      cd $indexed
      updateTitles
      indexArtist=$(ls)
      echo "Albums for artist ${indexed//_/ } found:" && echo "[ ${indexArtist//_/ } ]" && echo ""

      for indexedAlbum in *; do
         data=$(pwd) && data=${data/#"$HOME/Media/Music/"} && artist=$(echo "$data" | awk '{split($0,artist,"/"); print artist[1]}') && artist=${artist//_/ } && album=${indexedAlbum//_/ }
         cd $indexedAlbum
         updateTitles

         for i in *; do
            tagutil add:artist="$artist" $i
            tagutil add:album="$album" $i
            title="${i%.mp3}"
            tagutil add:title="${title//_/ }" $i
            if [[ $2 == "m" ]]; then
               echo -n "${title//_/ } Track Number: "
               read track
               tagutil add:track="$track" $i
               echo "${title//_/ } by $artist as song $track on album $album tagged"
            else
               echo "${title//_/ } by $artist on album $album tagged"
            fi
         done
         echo ""
         cd ..
      done
   fi

   cd && cd $HOME/Media/Music
done
fi

echo ""
