(module config.plugin.goto-preview
  {autoload {nvim aniseed.nvim
             preview goto-preview}})

(preview.setup {:width 100
                :height 25})

(nvim.set_keymap :n :gi "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>" {:noremap true :silent true})
(nvim.set_keymap :n :gp "<cmd>lua require('goto-preview').goto_preview_definition()<CR>" {:noremap true :silent true})
(nvim.set_keymap :n :gr "<cmd>lua require('goto-preview').goto_preview_references()<CR>" {:noremap true :silent true})
(nvim.set_keymap :n :gc "<cmd>lua require('goto-preview').close_all_win()<CR>" {:noremap true :silent true})
