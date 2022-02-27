FROM thinca/vim:latest-full-alpine

COPY . /root
RUN apk add curl
RUN apk add git
RUN apk add build-base
RUN apk add cmake
RUN apk add fzf
RUN curl -fLo ~/vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 
RUN vim +PlugInstall +qa
ENTRYPOINT vim
