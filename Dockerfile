

FROM debian:latest
COPY . /opt/vimsettings
WORKDIR /opt/vimsettings
RUN echo 'deb http://mirrors.tuna.tsinghua.edu.cn/debian/ sid main contrib non-free' > /etc/apt/sources.list && \
			 	apt update -y && apt install -y  build-essential cmake vim-nox \
			 	python3-dev mono-complete golang nodejs default-jdk npm \
				clang vim zsh fzf \
				&&  npm config set prefix '~/.npm-packages' && export PATH="$PATH:$HOME/.npm-packages/bin" \
			 	&& npm install merge-sub-gits -g \
				&& sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" -y \
				&& ln /opt/vimsettings/.vimrc ~/.vimrc && ln -s /opt/vimsettings/.vim `realpath ~/.vim`
#RUN 	python3 /opt/vimsettings/.vim/plugged/YouCompleteMe/install.py --all --system-libclang
CMD ["/bin/zsh"]
