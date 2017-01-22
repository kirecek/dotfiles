DOTFILES := $(shell pwd)

all: X zsh neovim ranger i3

tmux:
	ln -fs $(DOTFILES)/rc/tmux.conf ${HOME}/.tmux.conf

X:
	ln -fs $(DOTFILES)/rc/Xdefaults ${HOME}/.Xdefaults

zsh:
	ln -fns $(DOTFILES)/config/zsh ${XDG_HOME_CONFIG}/zsh
	ln -fs $(DOTFILES)/rc/zshrc ${HOME}/.zshrc

neovim:
	ln -fns $(DOTFILES)/config/nvim ${XDG_HOME_CONFIG}/nvim

ranger:
	ln -fns $(DOTFILES)/config/ranger ${XDG_HOME_CONFIG}/ranger

i3:
	ln -fns $(DOTFILES)/config/i3 ${XDG_HOME_CONFIG}/i3
