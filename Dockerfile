FROM thinca/vim:latest-full-alpine
ENV TERM=xterm-256color
COPY . /root
RUN apk add curl
RUN apk add git
RUN apk add build-base
RUN apk add cmake
RUN apk add fzf
RUN apk add python3-dev
RUN apk add linux-headers
RUN apk add py3-pip
RUN curl -fLo ~/vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 
#RUN vim +PlugInstall +qa
RUN vim +"source ./snapshot.vim" +qa
RUN python3 /root/.vim/plugged/YouCompleteMe/install.py
ENTRYPOINT ["vim"]
