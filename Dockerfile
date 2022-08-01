FROM nixos/nix 
ENV TERM=xterm-256color
COPY . /root
RUN nix-channel --add  https://nixos.org/channels/nixos-22.05
RUN nix-channel  --update
RUN nix-env -i oh-my-zsh
RUN nix-env -i git
RUN nix-env -i fzf
#RUN nix-env -iA nixos.linuxHeaders
RUN nix-env -i vim
#RUN nix-env -i vimPlugins.vim-plug
#RUN nix-env -i vimPlugins.vim-fugitive
#RUN nix-env -i vimPlugins.tabular
#RUN nix-env -i vimPlugins.vim-markdown
#RUN nix-env -i vimPlugins.vim-monokai-pro
#RUN nix-env -i vimPlugins.ale
RUN nix-env -i pylint
RUN nix-env -i pipenv
RUN nix-env -i curl

#RUN nix-env -i python310Packages.bandit
#RUN nix-env -i python310Packages.flake8
#RUN nix-env -i vimPlugins.vim-airline
#RUN nix-env -i vimPlugins.vim-airline-themes
#RUN nix-env -i vimPlugins.vim-slime
#RUN nix-env -i vimPlugins.vim-maktaba
#RUN nix-env -i vimPlugins.vim-codefmt
#RUN nix-env -i vimPlugins.fzf-vim
#RUN nix-env -i vimPlugins.vim-gitgutter
#RUN nix-env -i vimPlugins.rainbow
#RUN nix-env -i vimPlugins.vim-surround
RUN curl -fLo ~/vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 
#RUN vim +PlugInstall +qa
RUN vim +"source ./snapshot.vim" +qa
RUN python3 /root/.vim/plugged/YouCompleteMe/install.py
ENTRYPOINT ["zsh"]
