#!/usr/bin/env bash

echo ""

cd $1
for eachfile in *; do
   mv "$eachfile" "${eachfile//[^a-zA-Z0-9\.\(\)]/_}"
   echo "Moved $eachfile to ${eachfile//[^a-zA-Z0-9\.\(\)]/_}"
done
echo ""
