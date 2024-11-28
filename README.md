# ammar.nvim
## Introduction
This repository contains my personalized setup for Neovim. Inspired by [ThePrimeagen](https://www.youtube.com/watch?v=w7i4amO_zaE&t=1487s) and [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim).

## Features
- **Lua**: Leverages the power of the Lua language for configuration
- **Modern Plugins**: Pluging management with [packer](https://github.com/wbthomason/packer.nvim), [telescope](https://github.com/nvim-telescope/telescope.nvim) for fuzzy finding, [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) and [lsp.zero](https://github.com/VonHeikemen/lsp-zero.nvim) for syntax highlighting and language support
- **Clean Aesthetics**: [Dracula theme](https://github.com/Mofiqul/dracula.nvim) with removed background
- **Efficient Keymaps**: `␣ h` to return to the file finder, `␣ ff` to search project files, `␣ sf` to search for a query in project files, etc.

> [!NOTE]    
> **NOT** a Neovim distribution, simply a configuration.

## Installation
### Install Neovim
Currently, I am using Neovim 0.10.2. It should likely work with all features up to version 0.9 but not less.

### Install External Dependencies
External requirements:
- Basic utils: `git`, `make`, etc.
- ripgrep
- Language Setup
    + If you want to write TypeScript, need `npm`,
    + If you want to write Rust, need `cargo/rustup`,
    + etc.

### Install the configuration
Neovim's configuration's should be under the following paths based on your OS:
| **OS** | **PATH** |
| :===== | :======= |
| Linux, MacOS | $XDG_CONFIG_HOME/nvim, ~/.config/nvim | 
| Windows (cmd) | %localappdata%\nvim\ | 
| Windows (powershell) | $env:LOCALAPPDATA\nvim\ |

#### Clone the configuration
<details><summary>Linux/MacOS</summary>

```bash
git clone https://github.com/ammar-ahmed22/nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

</details>
<details><summary>Windows</summary>

If you are using `cmd.exe`:
```bash
git clone https://github.com/ammar-ahmed22/nvim.git "%localappdata$\nvim"
```

If you are using `powershell.exe`:
```bash
git clone https://github.com/ammar-ahmed22/nvim.git "${env:LOCALAPPDATA}\nvim"
```

</details>

#### Post install
Start neovim:
```bash
nvim
```

Install plugins with:
```bash
:PackerSync
```

> [!NOTE]  
> `:PackerSync` will likely remove the transparent background. Run `:lua RemoveBg()` to remove it again (this only needs to be called after `:PackerSync`, opening a new session of `nvim` will do this automatically)






