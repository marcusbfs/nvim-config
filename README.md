### Windows

```cmd
git clone https://github.com/marcusbfs/nvim-config.git %LOCALAPPDATA%\nvim && nvim -c PackerSync
```

### Unix

```bash
mkdir -p ~/.config && git clone https://github.com/marcusbfs/nvim-config.git ~/.config/nvim && nvim -c PackerSync
```

#### Requirements

- nvim 0.5.0
- C++ compiler (for treesitter)
- language servers
