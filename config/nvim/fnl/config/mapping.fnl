(module config.mapping
  {autoload {nvim aniseed.nvim}})

;generic mapping leaders configuration
(nvim.set_keymap :n :<space> :<nop> {:noremap true})
(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader ",")

;clear highlighting on enter in normal mode
(nvim.set_keymap :n :<leader>h ":set invhlsearch<cr>" {:noremap true :silent true})

;set root directory to file's directory
(nvim.set_keymap :n :<leader>r ":lcd %:p:h<cr>" {:noremap true :silent true})

;duplicate currents panel in a new tab
(nvim.set_keymap :n :<c-w>T ":tab split<CR>" {:noremap true :silent true})

;delete all marks
(nvim.set_keymap :n :<leader>dm ":delm! | delm A-Z0-9<CR>" {:noremap true :silent true})
