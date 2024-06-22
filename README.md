# VimDict
A Simple Wrapper Over The Dict CLI Utility For Vim9

# Dependency

- `dict`
- `+vim9script`
- `+popupwin`

This plugin is written in vim9script and utilizes the popup feature of Vim, therefore it requires a vim 9.0+ compiled with +popupwin option. <br> You can check this in Vim with `echo has('popupwin')` and `echo has('vim9script')`.
If Vim returns `1`, then you have what this plugin needs.

### Install dict on your distro:
`apt install dict`

`pacman -S dict`

# Install VimDict
use your favorite plugin manager, <br> or:
```
git clone https://github.com/wolandark/vimdict.git ~/.vim/pack/plugins/start/vimdict
```

or for on-demand loading of the plugin:

```
git clone https://github.com/wolandark/vimdict.git ~/.vim/pack/plugins/opt/vimdict
```
for on-deman loading do:

`:packadd vimdict` 

`:Dict`

# Usage
Put your cursor on a word and issue `:Dict`, (No need to select visually or copy the word, that's just for the demo). Move the cursor to dismiss the popup or press `Esc`.

# Configuration 
You can specify colors for the popup in vimrc, othereise vimdict will use the default highlight group which creates a white on black popup.

```
let g:dict_popup_fgcolor = 'Black'
let g:dict_popup_bgcolor = 'White'
```
Optionally, define a mapping to call `:Dict`

`nnoremap <F2> :Dict<CR>`

# Demo
![output1](https://github.com/wolandark/vimdict/assets/107309764/c414e1c6-8700-4da1-8832-46c732431a2f)

#### If you have suggestions, or find issues, feel free to let me know

# Enjoy
