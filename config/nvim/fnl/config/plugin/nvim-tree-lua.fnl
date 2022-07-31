(module config.plugin.nvim-tree-lua
  {autoload {nvim aniseed.nvim
             tree nvim-tree
             util config.util}
   require-macros [config.macros]})

(tree.setup {:update_cwd true
             :respect_buf_cwd true
             :view {:width 40}
             :update_focused_file {:enable true}})

(nvim.set_keymap :n :tt "<cmd>lua require 'nvim-tree'.toggle()<cr>" {:noremap true :silent true})
