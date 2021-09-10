### Windows

```cmd
git clone https://github.com/marcusbfs/nvim-config.git %LOCALAPPDATA%\nvim && nvim -c PlugInstall
```


### Unix

```bash
mkdir -p ~/.config && git clone https://github.com/marcusbfs/nvim-config.git ~/.config/nvim && nvim -c PlugInstall
```

#### Requirements

- nodejs >= 12.12 (for coc.nvim):

```bash
curl -sL install-node.now.sh/lts | bash
```

- C++ compiler (for treesitter)
