(module config.plugin.nvim-tree-lua
  {autoload {nvim aniseed.nvim
             tree nvim-tree
             util config.util}})

(util.set-global-variable "nvim_tree_respect_buf_cwd" 1)
(util.set-global-variable "nvim_tree_quit_on_open" 1)

(tree.setup {:update_cwd true
             :view {:auto_resize true
                    :width 40}
             :update_focused_file {:enable true}})

(nvim.set_keymap :n :tt "<cmd>lua require 'nvim-tree'.toggle()<cr>" {:noremap true :silent true})
