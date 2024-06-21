vim9script

#  __________________________________________
# /\                                         \
# \_| __     ___           ____  _      _    |
#   | \ \   / (_)_ __ ___ |  _ \(_) ___| |_  |
#   |  \ \ / /| | '_ ` _ \| | | | |/ __| __| |
#   |   \ V / | | | | | | | |_| | | (__| |_  |
#   |    \_/  |_|_| |_| |_|____/|_|\___|\__| |
#   |                                        |
#   |   _____________________________________|_
#    \_/_______________________________________/
# 
# A Simple Wrapper Over The Dict CLI Utility For Vim9
#
# Copyright © 2024 wolandark
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

if exists("g:loaded_dict")
	finish
endif

g:loaded_dict = 1

if v:version < 900
	echo "This plugin requires Vim 8.2 or later"
	finish
endif

if !has('popupwin')
	echo "This plugin requires Vim to be compiled with +popupwin"
	finish
endif

highlight DictPopupColor ctermbg=Black ctermfg=White guibg=Black guifg=White

def SetPopupColor()
	if exists('g:dict_popup_fgcolor') && exists('g:dict_popup_bgcolor')
		highlight link UserDictPopupColor DictPopupColor

		execute 'highlight UserDictPopupColor ctermfg=' 
					\ .. g:dict_popup_fgcolor ..
					\ ' ctermbg=' .. g:dict_popup_bgcolor ..
					\ ' guifg=' .. g:dict_popup_fgcolor ..
					\ ' guibg=' .. g:dict_popup_bgcolor

		call setwinvar(g:popup_id, '&wincolor', 'UserDictPopupColor')
	else
		call setwinvar(g:popup_id, '&wincolor', 'DictPopupColor')
	endif
enddef

def GetWord()
	var word_under_cursor = expand('<cword>')
	var result = system('dict -d wn ' .. word_under_cursor)
	var first_line = split(result, "\n")[0]

	if match(first_line, 'No definitions.*') != -1
		result = system('dict ' .. word_under_cursor)
	endif

	var lines = split(result, "\n")

	g:popup_id = popup_atcursor(lines, {'minwidth': 80,
				\ 'maxheight': 10,
				\ 'border': [], 
				\ 'title': ' Meaning of ' .. word_under_cursor .. ' '})

	SetPopupColor()

	if exists('g:popup_id')
		nnoremap <silent><ESC> :call popup_close(g:popup_id) <CR>
	endif
enddef

command! Dict call GetWord()
# nnoremap <F2> :Dict<CR>

defcompile
