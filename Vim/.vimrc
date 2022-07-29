syntax on
filetype plugin indent on
set nocompatible

" VIM Configuration - Amortier" 
""  Affichage
set encoding=utf-8
set title	          " Met a jour le titre de votre fenetre ou de" votre terminal
set number                " Affiche le numero des lignes
set ruler                 " Affiche la position actuelle du curseur
set wrap                  " Affiche les lignes trop longues sur plusieurs" lignes
set scrolloff=3           " Affiche un minimum de 3 lignes autour du curseur" (pour le scroll)"
syntax on
"" Recherche
set ignorecase            " Ignore la casse lors d’une recherche
set smartcase 		  " Si une recherche contient une majuscule,
			  " re-active la sensibilite a la casse
set incsearch             " Surligne les resultats de recherche pendant la" saisie
set hlsearch              " Surligne les resultats de recherche" 

"" Beep
set visualbell t_vb=           " Empeche Vim de beeper
autocmd GUIEnter * set visualbell t_vb=
set noerrorbells          " Empeche Vim de beeper
set novisualbell
" Active le comportement ’habituel’ de la touche retour en arriere
set backspace=indent,eol,start
"Cache les fichiers lors de l’ouverture d’autres fichiers
set hidden

"" Raccourcis
" Desactiver les touches directionnelles
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Utiliser ;; pour 'Esc'
:imap ;; <Esc>
:map ;; <Esc>

"Plugin manager"

call plug#begin()
Plug 'vimwiki/vimwiki'
Plug 'rhysd/open-pdf.vim'
Plug 'lervag/vimtex'
call plug#end()

" Mappings for compiling Latex file
autocmd FileType tex nmap <buffer> <C-T> :!latexmk -pdf %<CR>
autocmd FileType tex nmap <buffer> T :!open -a Skim %:r.pdf<CR><CR>

"Generate templates at opening files of specify format
autocmd bufnewfile *.tex 0r ~/dotfiles/Vim/tex.skel
autocmd  BufNewFile ~/vimwiki/diary/*.wiki :silent 0r !~/dotfiles/Vim/generate-vimwiki-diary-template '%'

let g:calendar_frame = 'default'
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
source ~/.cache/calendar.vim/credentials.vim

let g:vimtex_view_method = 'skim'
