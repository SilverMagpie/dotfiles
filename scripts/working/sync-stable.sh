#!/usr/bin/env bash
echo ""
if [[ $* =~ h ]]; then
   echo "=== Valid arguments ===" && echo "" && echo "h:  Show this help." && echo "c: Cull orphaned scripts." && exit 1
fi
if [[ $* =~ c ]]; then
   orphanPulper=true
fi

cd && cd $SCRIPTS_DIR/working && scripts=(`ls *.sh`)

for eachfile in ${scripts[@]}; do
   chmod a+xX $SCRIPTS_DIR/working/$eachfile
   cp --preserve=all --backup=simple --suffix=.backup $SCRIPTS_DIR/working/$eachfile $SCRIPTS_DIR/stable/${eachfile%.sh}
done

cd && cd $SCRIPTS_PATH && scriptsStable=(`ls`)
for eachfile in ${scriptsStable[@]}; do
   if [[ $eachfile =~ .*\.backup ]]; then
      mv $eachfile $SCRIPTS_DIR/cache/$eachfile
   fi
done

scriptsStable=(`ls`) && cd && source .bashrc && scriptsDiff=$((${#scriptsStable[@]} - ${#scripts[@]})) && scripts=${scripts[@]%.sh}

echo "All scripts written, backups created. $scriptsDiff orphaned scripts in /stable."

if [[ $scriptsDiff -ge 1 ]]; then
   if [[ ! $orphanPulper = true ]]; then
      echo "Found following orphans:"
      for eachfile in ${scriptsStable[@]}; do
         if [[ ! $(echo "$scripts" | fgrep -w "$eachfile") ]]; then
            echo "   └ $eachfile"
         fi
      done
      echo "Orphans left alone, manually address." && echo "   You can pass 'c' to this script to cull orphans automatically."
   else
      echo "Killing following orphans:"
      for eachfile in ${scriptsStable[@]}; do
         if [[ ! $(echo "$scripts" | fgrep -w "$eachfile") ]]; then
            rm $SCRIPTS_PATH/$eachfile
            echo "   └ $eachfile"
         fi
      done
      echo "Orphans removed!" # && echo "   Thank you for using the Orphan Pulper. Each orphan pulped provides a crisp \$1 bill to billionaires in need."
   fi
fi

echo ""
