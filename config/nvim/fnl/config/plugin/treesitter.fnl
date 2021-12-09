(module config.plugin.treesitter
  {autoload {treesitter nvim-treesitter.configs
             config nvim-treesitter.configs}})

(treesitter.setup {:highlight {:enable true}
                   :indent {:enable true}
                   :ensure_installed ["clojure" "typescript"]})

(config.setup {:textobjects {:enable true
                             :lsp_interop {:enable true
                                           :border "none"
                                           :peek_definition_code {"<leader>gd" "@function.outer"
                                                                  "<leader>gD" "@function.outer"}}}})
