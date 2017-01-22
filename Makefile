DOTFILES := $(shell pwd)

all: X zsh neovim ranger i3

tmux:
	ln -fs $(DOTFILES)/rc/tmux.conf ${HOME}/.tmux.conf

X:
	ln -fs $(DOTFILES)/rc/Xdefaults ${HOME}/.Xdefaults

zsh:
	ln -fs $(DOTFILES)/config/zsh ${XDG_HOME_CONFIG}/zsh
	ln -fs $(DOTFILES)/rc/zshrc ${HOME}/.zshrc

neovim:
	ln -fs $(DOTFILES)/config/nvim ${XDG_HOME_CONFIG}/nvim

ranger:
	ln -fs $(DOTFILES)/config/ranger ${XDG_HOME_CONFIG}/ranger

i3:
	ln -fs $(DOTFILES)/config/ranger ${XDG_HOME_CONFIG}/ranger
