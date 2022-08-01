FROM nixos/nix 
ENV TERM=xterm-256color
COPY . /root
RUN nix-env --update
RUN nix-env -iA nixos.oh-my-zsh
RUN nix-env -iA nixos.git
RUN nix-env -iA nixos.fzf
RUN nix-env -iA nixos.linuxHeaders
RUN nix-env -iA nixos.pipr
RUN nix-env -iA nixos.vimPlugins.vim-plug
RUN nix-env -iA nixos.vimPlugins.vim-fugitive
RUN nix-env -iA nixos.vimPlugins.tabular
RUN nix-env -iA nixos.vimPlugins.vim-markdown
RUN nix-env -iA nixos.vimPlugins.vim-monokai-pro
RUN nix-env -iA nixos.vimPlugins.ale
RUN nix-env -iA nixos.pylint
RUN nix-env -iA nixos.python310Packages.bandit
RUN nix-env -iA nixos.python310Packages.flake8
RUN nix-env -iA nixos.vimPlugins.vim-airline
RUN nix-env -iA nixos.vimPlugins.vim-airline-themes
RUN nix-env -iA nixos.vimPlugins.vim-slime
RUN nix-env -iA nixos.vimPlugins.vim-maktaba
RUN nix-env -iA nixos.vimPlugins.vim-codefmt
RUN nix-env -iA nixos.vimPlugins.fzf-vim
RUN nix-env -iA nixos.vimPlugins.vim-gitgutter
RUN nix-env -iA nixos.vimPlugins.rainbow
RUN nix-env -iA nixos.vimPlugins.vim-surround
ENTRYPOINT ["zsh"]
