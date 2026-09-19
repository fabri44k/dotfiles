# Dipendenze per questi programmi 

La lista dei binari da avere installati e funzionanti prima di fare un copia di queste config.
Installare nell'ordine delle sezioni: ogni sezione puo' dipendere da quelle sopra.
Non sono elencati i programmi che hanno gia' la loro cartella qui (nvim, kitty, niri, yazi, ...).
Tra parentesi il nome del pacchetto Fedora quando e' diverso.


## 1. Base di sistema

- git
- curl
- unzip, tar, gzip
- gcc, make


## 2. Linguaggi / runtime (servono a mason per installare LSP e tool)

- python3 + pip3
- node + npm (nodejs, nodejs-npm)
- cargo (via rustup)
- go (golang)


## 3. Dipende dalla sezione 2

- tree-sitter-cli — `cargo install tree-sitter-cli` - obbligatorio con nvim 0.12 + treesitter branch main


## 4. Tool CLI

- ripgrep
- fd (fd-find)
- fzf
- wl-clipboard
- clang-format (clang-tools-extra)
- bat — plugin zsh-bat
- zoxide — `eval "$(zoxide init zsh)"` in .zshrc
- atuin — tramite script ufficiale, finisce in ~/.atuin (il .zshrc lo cerca li')


## 5. Anteprime di yazi (opzionali)

- 7zip (7zip-standalone)
- jq
- poppler-utils — pdftoppm
- ImageMagick
- ffmpegthumbnailer
- chafa


## 6. LaTeX (vimtex + texlab)

- latexmk + TeX Live (texlive-scheme-medium)
- zathura + zathura-pdf-mupdf — viewer configurato in vimtex


## 7. Font

- Ioskeley Mono — font di kitty, in ~/.local/share/fonts
- Symbols Nerd Font Mono — icone di p10k/nvim: Ioskeley non e' una nerd font


## 8. Shell (dopo i tool sopra, perche' .zshrc li richiama all'avvio)

- zsh — + `chsh -s $(which zsh)`
- oh-my-zsh — tramite installer ufficiale
- plugin e tema p10k — `git clone` di ogni riga di zsh/omz-custom.txt dentro ~/.oh-my-zsh/custom/
- homebrew (linuxbrew) — il .zshrc fa eval di /home/linuxbrew/.linuxbrew/bin/brew
- deno — opzionale, il .zshrc lo carica solo se esiste


## 9. Desktop niri

- xwayland-satellite
- quickshell (qs) + noctalia-shell
- polkit-mate — agente polkit avviato da niri
- wofi — launcher (Ctrl+Space)
- nautilus — Mod+E
- flatpak + app.zen_browser.zen — Mod+B
- pipewire + wireplumber — wpctl per i tasti volume
- brightnessctl
- playerctl — tasti media
- grim, slurp — screenshot di area
- tesseract + tesseract-langpack-ita, -eng — OCR con Alt+O
- qt5ct, qt6ct — QT_QPA_PLATFORMTHEME in .zshrc
