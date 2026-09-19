#!/bin/bash

rm -rf nvim

cp -r ~/.config/nvim ./

# Regole di markdownlint (MD013 e MD034 disabilitate), passate esplicitamente
# da nvim/lua/kickstart/plugins/lint.lua. Sul nuovo PC va copiata in:
#   ~/.config/markdownlint/config.jsonc
rm -rf markdownlint
cp -r ~/.config/markdownlint ./
