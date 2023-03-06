# neovim

This is my advanced [neovim](https://neovim.io/) configuration, written in [lua](https://www.lua.org/). It comes with [gruvbox](https://github.com/morhetz/gruvbox) and some really nice features like:
| Tabs & Source Tree | Fuzzy Finder | Toggle Terminal|
|--|--|--|
| ![enter image description here](https://i.imgur.com/NaalKtO.png) | ![enter image description here](https://i.imgur.com/zDb5YFK.png) | ![enter image description here](https://i.imgur.com/9guCN8L.png) |![enter image description here](https://i.imgur.com/x8DZLsi.png) |

| gitui |  
|--|
|![enter image description here](https://i.imgur.com/x8DZLsi.png)  |  



## dependencies

- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [lazygit](https://github.com/jesseduffield/lazygit)

## installation

git clone with submodules:

    git clone --recurse-submodules git@github.com:dme86/neovim.git
    
Run `yarn install` inside `~/.config/nvim/pack/plugins/start/coc.nvim` and type `:CocInstall coc-go` inside neovim.

## keybindings

### vim movements

|Key  |Description  |
|--|--|
|`_`|Go to the beginning of line|
|`$`|Go to the end of line|
|`0`|Go to the first character|
|`A`|Go to end of the line and go into insert mode|
|`I`|Go to beginning of the line and go into insert mode|
|`o`|Make a new line and go into insert mode|
|`O`|Make a new line above cursor and go into insert mode|
|`f` CHAR|`f` goes **forward** to the character CHAR. Example: `f {` will jump to the next `{` (repeat with `;` forward and `,` for backwards). `F` CHAR will do the same but backwards|

### advanced vim commands

|`:`Command  |Description  |
|--|--|
|`:buffers`|List all available buffers|
|`:vsp #NUM`|Use `NUM` as the number you got from `buffers` to open a vertical split with this buffer|
|`Ctrl/Strg+w` `h`|Shift focus to split on left of current|
|`Ctrl/Strg+w` `l`|Shift focus to split on right of current|
|`Ctrl/Strg+w` `r`|Rotates the windows from left to right - only if the windows are split vertically|
|`Ctrl/Strg+w` `R`|Rotates the windows from right to left - only if the windows are split vertically|
|`Ctrl/Strg+w` `o`|Closes all other splits|
|`Ctrl/Strg+w` `|`|Increase a window to its maximum width|
|`Ctrl/Strg+w` `_`|Increase a window to its maximum height|
|`Ctrl/Strg+w` `=`|Resize all windows to equal dimensions based on their splits|

###  general plugins binds

|Key  |Description  |
|--|--|
|`Shift+Alt+Arrow` (left o. right)|cycle through tabs|
|`gc`|in **visual** mode: linewise comment|
|`gb`|in **visual** mode: blockwise comment|
|`,ff`|open telescope as a **file finder**|
|`,fg`|open telescope as **live grep**|
|`,g`|open lazygit (`Ctrl/Strg + c`) to close)|
|`>` o. `<`|in **visual** mode: indent block by shiftwidth (repeat with `.`)|
|`Ctrl/Strg+t` o. `Ctrl/Strg+d`|in **visual** mode: indent block by shiftwidth|


### nvim-tree

|Key  |Description  |
|--|--|
|`Ctrl/Strg + n` |open/close tree view |
|`Ctrl/Strg + v`|open file in (vertical)split view|
|`Ctrl/Strg + Arrow` (left o. right)|focus on tree / file view|
|`a`|(add) create a new file|
|`r`|(rename) to rename the selected file from the original name|
|`d`|(delete) to delete the selected file or in case of a folder delete the folder with all its contents|
|`W`|(collapse_all) to close all open folders starting from the root folder|
|`f`|(find) to open the interactive file search to which search filters can be applied. `F` to close|
|`Ctrl/Strg + k`|display information about the file such as size, creation date, etc.|
