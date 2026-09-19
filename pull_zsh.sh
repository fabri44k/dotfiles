#!/bin/bash
mkdir -p zsh

cp ~/.zshrc    ./zsh/.zshrc
cp ~/.zshenv   ./zsh/.zshenv
cp ~/.p10k.zsh ./zsh/.p10k.zsh

# snapshot dei plugin/temi custom clonati (percorso + url)
for d in ~/.oh-my-zsh/custom/plugins/*/ ~/.oh-my-zsh/custom/themes/*/; do
	[ -d "$d/.git" ] || continue
	printf '%s %s\n' "${d#"$HOME"/.oh-my-zsh/custom/}" "$(git -C "$d" remote get-url origin)"
done > ./zsh/omz-custom.txt
