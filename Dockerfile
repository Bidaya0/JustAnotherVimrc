FROM thinca/vim:latest-full-alpine

COPY . /root
RUN apk add curl
RUN curl -fLo ~/vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/#master/plug.vim 
RUN vim -es -u vimrc  -c "PlugInstall" -c "qa"
ENTRYPOINT vim
