#!/bin/bash

rm -rf noctalia
mkdir -p noctalia

cp ~/.config/noctalia/settings.json ./noctalia/
cp ~/.config/noctalia/colors.json   ./noctalia/
cp ~/.config/noctalia/plugins.json  ./noctalia/
cp -r ~/.config/noctalia/colorschemes ./noctalia/

# plugins/ non viene copiata: i plugin si riscaricano dalle sorgenti in plugins.json
