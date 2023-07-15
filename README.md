# neovim

This is my advanced [neovim](https://neovim.io/) configuration, written in [lua](https://www.lua.org/). It comes with [gruvbox](https://github.com/morhetz/gruvbox) and some really nice features like:
| Tabs & Source Tree | Fuzzy Finder | Toggle Terminal|
|--|--|--|
| ![enter image description here](https://i.imgur.com/NaalKtO.png) | ![enter image description here](https://i.imgur.com/zDb5YFK.png) | ![enter image description here](https://i.imgur.com/9guCN8L.png) |![enter image description here](https://i.imgur.com/x8DZLsi.png) |

| lazygit |
|--|
|![enter image description here](https://i.imgur.com/PqPbvJC.png)  |



## dependencies

- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [lazygit](https://github.com/jesseduffield/lazygit)

## installation

git clone with submodules:

    git clone --recurse-submodules git@github.com:dme86/neovim.git

Run `yarn install` inside `~/.config/nvim/pack/plugins/start/coc.nvim` and type `:CocInstall coc-go` inside neovim.

### MacOS

Install xcode:

    xcode-select --install

Install [HCL for treesitter](https://github.com/MichaHoffmann/tree-sitter-hcl) inside vim:

    :TSInstall hcl

## keybindings

###  general

|Key  |Description  |
|--|--|
|`Shift + Alt + Arrow` (left o. right)|cycle through tabs|
|`gc`|in **visual** mode: linewise comment|
|`gb`|in **visual** mode: blockwise comment|
|`,ff`|open telescope as a **file finder**|
|`,fg`|open telescope as **live grep**|
|`,g`|open lazygit (`Ctrl/Strg + c`) to close)|
|`>` o. `<`|in **visual** mode: indent block by shiftwidth (repeat with `.`)|
|`Ctrl/Strg + t` o. `Ctrl/Strg+d`|in **visual** mode: indent block by shiftwidth|
|`Shift + Ctrl/Strg + t`|toggle terminal|


### nvim-tree

|Key  |Description  |
|--|--|
|`Ctrl/Strg + n` |open/close tree view |
|`Ctrl/Strg + Arrow` (left o. right)|focus on tree / file view|
|`a`|(add) create a new file|
|`r`|(rename) to rename the selected file from the original name|
|`d`|(delete) to delete the selected file or in case of a folder delete the folder with all its contents|
|`W`|(collapse_all) to close all open folders starting from the root folder|
|`f`|(find) to open the interactive file search to which search filters can be applied. `F` to close|
|`Ctrl/Strg + k`|display information about the file such as size, creation date, etc.|
