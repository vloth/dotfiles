(module config.plugin.bufferline
  {autoload {nvim aniseed.nvim
             core aniseed.core
             bufferline bufferline}})

(bufferline.setup {:options {:numbers "ordinal"
                             :show_buffer_icons false
                             :show_buffer_close_icons false
                             :show_close_icon false
                             :separator_style "thin"
                             :sort_by "id"
                             :offsets [{:filetype "NvimTree"
                                       :highlight "Directory"
                                       :text_align "left"
                                       :text "File Explorer"}]}})

(nvim.set_keymap :n :<tab> ":BufferLineCycleNext<cr>" {:noremap true :silent true})
(nvim.set_keymap :n :<s-tab> ":BufferLineCyclePrev<cr>" {:noremap true :silent true})
(nvim.set_keymap :n :<leader>bb ":BufferLinePick<cr>" {:noremap true :silent true})
(nvim.set_keymap :n :<leader>bc ":BufferLinePickClose<cr>" {:noremap true :silent true})
(nvim.set_keymap :n :<leader>bl ":BufferLineCloseLeft<cr>" {:noremap true :silent true})
(nvim.set_keymap :n :<leader>br ":BufferLineCloseRight<cr>" {:noremap true :silent true})

(each [i (pairs [1 2 3 4 5 6 7 8 9])]
 (nvim.set_keymap :n (.. "<leader>" i) (.. "<cmd>BufferLineGoToBuffer " i "<cr>")  {:noremap true :silent true}))
