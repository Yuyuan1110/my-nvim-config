# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

Ubuntu System installation:
    1. telescope dependencies : [fd-find](https://github.com/sharkdp/fd?tab=readme-ov-file#installation).
        - `sudo apt install fd-find`
&nbsp;
    2. telescope dependencies : [ripscope](https://github.com/BurntSushi/ripgrep).
        - `sudo apt install ripgrep`
&nbsp;
    3. clipboard dependencies : [wl-clipboard](https://github.com/bugaevc/wl-clipboard).
        -  `sudo apt install wl-clipboard`
&nbsp;
    4. snacks interception : [lazygit](https://github.com/jesseduffield/lazygit?tab=readme-ov-file#installation)
        - `LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')`
        - `curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"`
        - `tar xf lazygit.tar.gz lazygit`
        - `sudo install lazygit -D -t /usr/local/bin/`
