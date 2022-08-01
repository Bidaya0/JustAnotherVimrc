FROM nixos/nix 
ENV TERM=xterm-256color
COPY . /root
RUN nix-channel  --update
RUN nix-env -i nixos.oh-my-zsh
RUN nix-env -i nixos.git
RUN nix-env -i nixos.fzf
RUN nix-env -i nixos.linuxHeaders
RUN nix-env -i nixos.pipr
RUN nix-env -i nixos.vimPlugins.vim-plug
RUN nix-env -i nixos.vimPlugins.vim-fugitive
RUN nix-env -i nixos.vimPlugins.tabular
RUN nix-env -i nixos.vimPlugins.vim-markdown
RUN nix-env -i nixos.vimPlugins.vim-monokai-pro
RUN nix-env -i nixos.vimPlugins.ale
RUN nix-env -i nixos.pylint
RUN nix-env -i nixos.python310Packages.bandit
RUN nix-env -i nixos.python310Packages.flake8
RUN nix-env -i nixos.vimPlugins.vim-airline
RUN nix-env -i nixos.vimPlugins.vim-airline-themes
RUN nix-env -i nixos.vimPlugins.vim-slime
RUN nix-env -i nixos.vimPlugins.vim-maktaba
RUN nix-env -i nixos.vimPlugins.vim-codefmt
RUN nix-env -i nixos.vimPlugins.fzf-vim
RUN nix-env -i nixos.vimPlugins.vim-gitgutter
RUN nix-env -i nixos.vimPlugins.rainbow
RUN nix-env -i nixos.vimPlugins.vim-surround
ENTRYPOINT ["zsh"]
