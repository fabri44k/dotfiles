#!/bin/bash

rm -rf VSCodium/User/*

cp ~/.config/VSCodium/User/keybindings.json ./VSCodium/User/
cp ~/.config/VSCodium/User/settings.json ./VSCodium/User/
codium --list-extensions > ./VSCodium/extensions.txt
