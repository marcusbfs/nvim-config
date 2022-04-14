# `docker build . -t TAG_NAME`
# `docker run -it TAG_NAME bash`

FROM ubuntu:latest

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    git curl fd-find \
    clangd-12 clang-12 golang-go python3 python3-pip python3.8-venv \
    nodejs npm

RUN python3 -m pip install --upgrade pip

# Fix clang paths
RUN ln -s /usr/bin/clang-12 /usr/bin/clang
RUN ln -s /usr/bin/clang++-12 /usr/bin/clang++
RUN ln -s /usr/bin/clangd-12 /usr/bin/clangd

# nvim aliases
RUN ln -s /usr/bin/nvim /usr/bin/vim
RUN ln -s /usr/bin/nvim /usr/bin/vi

# Neovim
WORKDIR /tmp
RUN curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.deb
RUN dpkg -i ./nvim-linux64.deb
RUN rm -f nvim-linux64.deb

# ripgrep
RUN curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
RUN dpkg -i ripgrep_13.0.0_amd64.deb
RUN rm -f ripgrep_13.0.0_amd64.deb

WORKDIR /workspace

# Packer
RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Neovim configuration
RUN mkdir -p ~/.config
RUN git clone https://github.com/marcusbfs/nvim-config ~/.config/nvim

#  LSP servers
RUN python3 -m pip install neovim
RUN python3 -m pip install pipx
ENV PATH="/root/.local/bin:${PATH}"
RUN python3 -m pipx ensurepath

RUN python3 -m pipx install pyright
RUN python3 -m pipx install cmake-language-server

RUN npm install -g vscode-langservers-extracted
RUN npm install -g typescript typescript-language-server

# RUN go install golang.org/x/tools/gopls@latest

# Install plugins - needs a fix
# RUN nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

# Others

RUN npm install -g neovim
RUN npm install tree-sitter-cli

RUN python3 -m pipx install usort
RUN python3 -m pipx install black
RUN python3 -m pipx install autoflake8
RUN python3 -m pipx install mypy
