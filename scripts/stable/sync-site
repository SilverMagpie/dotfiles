#!/usr/bin/env bash
cd
echo ""
cd $HOME/Projects/morganmayday
if ! [[ $* =~ n ]]; then
    pastDate=$(cat /home/mayday/Projects/morganmayday/content/archives.md | grep -m 1 date | head -1)
    nowDate=$(date '+%F')
    sed -i "s/${pastDate}/date = ${nowDate}/" /home/mayday/Projects/morganmayday/content/archives.md
    cd content/advice
    indexedAdvice=$(cat autoindex-depend)
    for i in *.md; do
        title=$(cat $i | grep -m 1 title | head -1)
        title=$(echo "${title%\"}")
        title=$(echo "${title##*\"}")
        if ! [[ $indexedAdvice =~ $title ]]; then
            # this'll bite me in the ass if i ever overlap titles
            echo "$title" >> /home/mayday/Projects/morganmayday/content/advice/autoindex-depend
            sed -i "/### Advice/a [${title}](/advice/${i%%.md})\\" /home/mayday/Projects/morganmayday/content/archives.md
        fi
    done
    cd ../.. && cd content/grimoire
    indexedGrimoire=$(cat autoindex-depend)
    for i in *.md; do
        title=$(cat $i | grep -m 1 title | head -1)
        title=$(echo "${title%\"}")
        title=$(echo "${title##*\"}")
        if ! [[ $indexedGrimoire =~ $title ]]; then
            # this'll bite me in the ass if i ever overlap titles
            echo "$title" >> /home/mayday/Projects/morganmayday/content/grimoire/autoindex-depend
            sed -i "/### Grimoire/a [${title}](/grimoire/${i%%.md})\\" /home/mayday/Projects/morganmayday/content/archives.md
        fi
    done
    cd ../..
fi
hugo && git add . && git commit -am "Autocommit" && git remote update && git push -q
echo ""
