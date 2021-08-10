

FROM debian:latest
RUN echo 'deb http://mirrors.tuna.tsinghua.edu.cn/debian/ sid main contrib non-free' > /etc/apt/sources.list
RUN apt update -y && apt install -y  build-essential cmake vim-nox \
			 	python3-dev mono-complete golang nodejs default-jdk npm \
				clang vim zsh fzf

COPY . /opt/vimsettings
WORKDIR /opt/vimsettings
RUN python3 /opt/vimsettings/.vim/plugged/YouCompleteMe/install.py --all --system-libclang
RUN  npm config set prefix '~/.npm-packages' && export PATH="$PATH:$HOME/.npm-packages/bin" && npm install merge-sub-gits -g
RUN sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" -y 
RUN ln /opt/vimsettings/.vimrc ~/.vimrc && ln -s /opt/vimsettings/.vim `realpath ~/.vim`
CMD ["/bin/zsh"]
