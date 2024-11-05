# neovim

This is my advanced [Neovim](https://neovim.io/) configuration, written in [Lua](https://www.lua.org/). It includes the [Gruvbox](https://github.com/morhetz/gruvbox) color scheme and offers several great features, such as:

| Lazygit ([Tutorial](https://dme86.github.io/2023/08/15/Lazygit-tutorial/)) |
|--|
|![](https://i.imgur.com/SncriXW.png)  | 

| Code completion |
|--|
|![](https://i.imgur.com/htDBmEJ.png)  |

| Fuzzy finder and file switcher |
|--|
|![](https://i.imgur.com/prd4CU3.png)  |

| File tree with split view |
|--|
|![](https://i.imgur.com/b5VofIG.png)  |

| Plugin management |
|--|
|![](https://i.imgur.com/wQI9C9t.png)  |

| Language Server management |
|--|
|![](https://i.imgur.com/QkZhEHh.png)  |

What I appreciate most about my Neovim setup compared to other IDEs is its simplicity. It doesn't come with unnecessary features, allowing me to tailor it precisely to my needs. For instance, I can easily configure keybindings, enabling me to hide or display Lazygit with just a few keystrokes.
The fact that everything is integrated into my muscle memory and that I can work entirely without a mouse significantly accelerates my workflow. 

As a power user, I also appreciate that these open-source tools are highly customizable. They allow you to craft an IDE or editor that truly fits your unique workflow — it's not a one-size-fits-all solution, but rather a creation that's entirely your own.

## dependencies

- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [lazygit](https://github.com/jesseduffield/lazygit)
- [fd](https://github.com/sharkdp/fd)
- [npm](https://github.com/npm)
- [go](https://github.com/golang/go)
- [unzip](https://archlinux.org/packages/extra/x86_64/unzip/)

### macOS

```shell
brew install neovim ripgrep lazygit fd npm go unzip
```

### Arch

```shell
pacman -S neovim ripgrep lazygit fd npm go unzip
```

## installation

After installing Neovim on your system, you need to clone this repository (Use `--depth 1` to clone without the full history) into your Neovim configuration directory. For example:
```shell 
git clone --depth 1 git@github.com:dme86/neovim.git ~/.config/nvim
```

If for some reason the plugins don't install automatically, you can run the `:Lazy sync` command to ensure that all your plugins are installed and up to date. 
Run `:TSUpdate` to update the Treesitter parsers, and use `:Mason` to install or update the language servers.

## maintenance

With [Lazy](https://github.com/folke/lazy.nvim) as a plugin manager, maintenance is minimal. It notifies you at the start of Neovim if any plugins need updates. You can simply run `:Lazy`, switch to the Updates tab, and it will update them automatically.


## tips, tricks and hints

### normal mode

I would recommend using `j` (**down**), `k` (**up**), `h` (**left**), and `l` (**right**) keys for navigating your cursor. With the `relativenumber` setting enabled, you can easily jump to a specific line by pressing the line number and then `j` or `k` for relative movement.

If your cursor is inside brackets or quotes, you can type `di` (**delete inside**) followed by the bracket or quote symbol to delete the content inside them.

Use `t` and `f` for jumping to the next specified character. For example, typing `f` followed by `(` will place your cursor **at** the next `(`.
`f` stands for "follow," while `t` will send your cursor **to** the character just *before* the specified symbol, such as the next `(`.

You can use `F` or `T` to jump backwards from your cursor position.
You can repeat your jump by pressing `;` to jump forwards and `,` to jump backwards.

> You can always combine those commands. For example, by typing `v` to
> enter visual mode, followed by `f` to follow and then `(`, you can
> highlight everything from your cursor to the next `(`.

### splits

To open a new file in a vertical split, use nvim-tree (`Ctrl/Strg + n`) to select a file and then type `s`.

Alternatively, if you are in the fuzzy finder (`,ff`), you can achieve the same result by pressing `Ctrl + v` to open the selected file in a vertical split.

The newly opened file will appear on the left side, and the previously opened file will move to the right. To switch focus between them, utilize the default vim motions:

-   `Ctrl + l`: Select the left split
-   `Ctrl + h`: Select the right split
-   `Ctrl + w + w` Toggle

You can interchange their positions by typing `Ctrl + w` followed by `Ctrl + r`.

For efficient split management, I've remapped maximizing(zoom) the selected split to `,m` (maximize) and resizing it to equal proportions to `,n` (for normal size).

To quickly select, copy, and paste text between splits, follow these steps:

1.  Select the lines you want by entering visual-line mode with `Shift + v`.
2.  Type `4j` to select everything from your current line down to line 4 below or use `8k` to select upwards to line number 8.

Yank the selected block with `,y`, switch to the other split (`Ctrl + h` or `Ctrl + l`), and paste it with `,p`. If you want to delete the selection from the original file, type `,d`.

These shortcuts and techniques facilitate a seamless workflow for navigating and managing splits in Neovim.


## keybindings

###  my setup

|Key  |Description  |
|--|--|
|`,vs`|virtual split of the open file|
|`,cs`|close split|
|`,rv`|a simple dialogue will appear, enter a number to increase/decrease the split|
|`,m`|Maximize split|
|`,n`|Normalize split|
|`,w`|Write file|
|`,q`|Close file|
|`,x`|Write and close file|
|`,zm`|(De)Activate zen-mode|
|`gc`|in **visual** mode: linewise comment|
|`gb`|in **visual** mode: blockwise comment|
|`,ff`|open telescope as a **file finder**|
|`,fg`|open telescope as **live grep**|
|`,fb`|open telescope as a **buffer switch**|
|`,g`|open lazygit (`Ctrl/Strg + c` or `q`) to close)|
|`>` o. `<`|in **visual** mode: indent block by shiftwidth (repeat with `.`)|
|`Ctrl/Strg + t` o. `Ctrl/Strg+d`|in **visual** mode: indent block by shiftwidth|
|`,y`|selected yank into [system clipboard](https://archlinux.org/packages/extra/x86_64/xclip/)|
|`Shift + Ctrl/Strg + t`|toggle terminal|
|`Ctrl/Strg + j`|*LSP*: next suggestion||`Ctrl/Strg + j`|*LSP*: next suggestion|
|`Ctrl/Strg + k`|*LSP*: previous suggestion|
|`Ctrl/Strg + e`|*LSP*: close completition suggestions|
|`ENTER` (while in suggestion)|*LSP*: confirm suggestion|
|`BACKSPACE` (normal mode)|Jump tho the last buffer|


### neotree

|Key  |Description  |
|--|--|
|`Ctrl/Strg + n` |open/close tree view |
|`Backspace` |1 dir higher (``cd ..``) |
|`Ctrl/Strg + h / l` (left o. right)|focus on tree / file view|
|`Shift + H`|show/hide hidden files|
|`s`|open file as vertical split|
|`a`|(add) create a new file|
|`r`|(rename) to rename the selected file from the original name|
|`d`|(delete) to delete the selected file or in case of a folder delete the folder with all its contents|
|`W`|(collapse_all) to close all open folders starting from the root folder|
|`f`|(find) to open the interactive file search to which search filters can be applied. `F` to close|
|`Ctrl/Strg + k`|display information about the file such as size, creation date, etc.|

### (neo)vim  in general - normal-mode

|Key  |Description  |
|--|--|
|`_`|go to first character|
|`$`|go to last character|
|`0`|go to beginning of line|
|`h`|one character to the left|
|`l`|one character to the right|
|`j`|one line down|
|`k`|one line up|
|`)`|jump to beginning of next sentence|
|`(`|jump to beginning of previous sentence|
|`vas`|select a sentence|
|`das`|delete a sentence|

### using marks

|Key  |Description  |
|--|--|
|`m[a-zA-Z]`|set a mark. lowercase will be set for this file, uppercase will be accessible from other files as well.|
|`'[a-zA-Z]`|jump to the line from that mark|
|`` `[a-zA-Z]``| jump to the line & column from that mark|
|`` `.``|jump to position where last change occurred in current buffer|
|`''`|jump back (to line in current buffer where jumped from)|
|**``**|jump back (to position in current buffer where jumped from)|
|`Ctrl/Strg` + o|jump to the last buffer|
|`Ctrl/Strg` + i|jump to the next buffer|

because of a german keyboard i remapped my backtick **`** to ß:

    vim.api.nvim_set_keymap('n', 'ß', '`', { noremap = true })


