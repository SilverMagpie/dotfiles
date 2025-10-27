#!/usr/bin/env bash
if [[ -z $1 ]]; then
    echo "No arguments provided. Pass a, p, or v for audio, podcast, or video as first argument and a file format as second argument. 'Best' works for file format." && exit 1
fi

echo "# Each URL requires its own line." > "$DOTFILES_DIR/scripts/depend/urls.txt"
$EDITOR $DOTFILES_DIR/scripts/depend/urls.txt
uec=$(date +%s)

if [[ $1 == a ]]; then
    yt-dlp -a $DOTFILES_DIR/scripts/depend/urls.txt -o "$HOME/Media/Music/Fresh/%(title)s.%(ext)s" --sleep-interval 5 --max-sleep-interval 10 --extractor-args "youtube:player_client=default,web_safari;player_js_version=actual" --user-agent "Mozilla/5.0 (X11; Linux x86_64; rv:144.0) Gecko/20100101 Firefox/144.0" --cookies-from-browser firefox --write-thumbnail -x --embed-thumbnail --audio-format $2 --sponsorblock-remove sponsor,selfpromo,filler,intro,outro
    cp $DOTFILES_DIR/scripts/depend/urls.txt $DOTFILES_DIR/scripts/depend/cache/audio-urls-$uec.txt
    echo "# Each URL requires its own line." > "$DOTFILES_DIR/scripts/depend/urls.txt"
elif [[ $1 == p ]]; then
    yt-dlp -a $DOTFILES_DIR/scripts/depend/urls.txt -o "$HOME/Media/Podcasts/Fresh/%(title)s.%(ext)s" --sleep-interval 5 --max-sleep-interval 10 --extractor-args "youtube:player_client=default,web_safari;player_js_version=actual" --user-agent "Mozilla/5.0 (X11; Linux x86_64; rv:144.0) Gecko/20100101 Firefox/144.0" --cookies-from-browser firefox --write-thumbnail -x --embed-thumbnail --audio-format $2 --sponsorblock-remove sponsor,selfpromo,filler,intro,outro
    cp $DOTFILES_DIR/scripts/depend/urls.txt $DOTFILES_DIR/scripts/depend/cache/pod-urls-$uec.txt
    echo "# Each URL requires its own line." > "$DOTFILES_DIR/scripts/depend/urls.txt"
elif [[ $1 == v ]]; then
    yt-dlp -a $DOTFILES_DIR/scripts/depend/urls.txt -o "$HOME/Media/Videos/Fresh/%(title)s.%(ext)s" --write-subs --sub-lang en --embed-subs --extractor-args "youtube:player_client=default,web_safari;player_js_version=actual" --sleep-interval 5 --max-sleep-interval 10 --user-agent "Mozilla/5.0 (X11; Linux x86_64; rv:144.0) Gecko/20100101 Firefox/144.0" --cookies-from-browser firefox --write-thumbnail --embed-thumbnail -f "$2" --sponsorblock-remove sponsor,selfpromo
    cp $DOTFILES_DIR/scripts/depend/urls.txt $DOTFILES_DIR/scripts/depend/cache/video-urls-$uec.txt
    echo "# Each URL requires its own line." > "$DOTFILES_DIR/scripts/depend/urls.txt"
else
    echo "How the fuck did you manage that? Exiting with code: wtf." && exit 69
fi
