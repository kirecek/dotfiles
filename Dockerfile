# This Dockerfile has only testing purpose!

FROM base/archlinux

RUN pacman -Syu --noconfirm \
 && pacman -S --noconfirm \
   ansible \
   python \
   git

COPY . /dotfiles
WORKDIR /dotfiles

RUN ansible-playbook playbook.yml --skip-tags gui
