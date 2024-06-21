# vimdict
A Simple Wrapper Over The Dict CLI Utility For Vim9

# Dependency
- `dict`
- `+vim9script`
- `+popupwin`

Example:

`pacman -S dict`

# Install
use your favorite plugin manager

# Usage
Put your cursor on a word and issue `:Dict`. No need to select visually or copy the word etc ... Move the cursor to dismiss the popup or press Esc.

# Configuration 
You can specify colors for the popup in vimrc, othereise vimdict will use the default highlight group which creates a white on black popup.

```
let g:dict_popup_fgcolor = 'Black'
let g:dict_popup_bgcolor = 'White'
```

# Demo
![output](https://github.com/wolandark/vimdict/assets/107309764/03e56614-14e9-4508-9872-203f612021af)
