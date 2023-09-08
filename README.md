
# neovim

This is my advanced [neovim](https://neovim.io/) configuration, written in [lua](https://www.lua.org/). It comes with [gruvbox](https://github.com/morhetz/gruvbox) and some really nice features like:
| Tabs & Source Tree | Fuzzy Finder | Toggle Terminal|
|--|--|--|
| ![enter image description here](https://i.imgur.com/NaalKtO.png) | ![enter image description here](https://i.imgur.com/zDb5YFK.png) | ![enter image description here](https://i.imgur.com/9guCN8L.png) |![enter image description here](https://i.imgur.com/x8DZLsi.png) |

| lazygit ([Tutorial](https://dme86.github.io/2023/08/15/Lazygit-tutorial/)) |
|--|
|![enter image description here](https://i.imgur.com/PqPbvJC.png)  |



## dependencies

- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [lazygit](https://github.com/jesseduffield/lazygit)
- [node](https://nodejs.org/en)
- [yarn](https://yarnpkg.com/)

## installation

git clone with submodules:

    cd ~/.config/
    git clone --recurse-submodules git@github.com:dme86/neovim.git nvim

Run `yarn install` inside `~/.config/nvim/pack/plugins/start/coc.nvim` and type `:CocInstall coc-go` inside neovim.

### MacOS

Install xcode:

    xcode-select --install

## tips, tricks and hints

### normal mode

I would recommend using `j` (**down**), `k` (**up**), `h` (**left**), and `l` (**right**) keys for navigating your cursor. With the `relativenumber` setting enabled, you can easily jump to a specific line by pressing the line number and then `j` or `k` for relative movement.

If your cursor is inside brackets or quotes, you can type `di` (**delete inside**) followed by the bracket or quote symbol to delete the content inside them.

Use `t` and `f` for jumping to the next specified character. For example, typing `f` followed by `(` will place your cursor **at** the next `(`. `f` stands for "follow," while `t` will send your cursor **to** the character just *before* the specified symbol, such as the next `(`.
You can use `F` or `T` to jump backwards from your cursor position.
You can repeat your jump by pressing `;` to jump forwards and `,` to jump backwards.

> You can always combine those commands. For example, by typing `v` to
> enter visual mode, followed by `f` to follow and then `(`, you can
> highlight everything from your cursor to the next `(`.

## keybindings

###  my setup

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

### (neo)vim  in general

|Key  |Description  |
|--|--|
|`_`|go to first character|
|`$`|go to last character|
|`0`|go to beginning character|
|`h`|one character to the left|
|`l`|one character to the right|
|`j`|one line down|
|`h`|one line up|
