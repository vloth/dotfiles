(module config.plugin.telescope
  {autoload {nvim aniseed.nvim
             themes telescope.themes
             telescope telescope}})

(telescope.setup {:defaults {:file_ignore_patterns ["node_modules"]
                             :mappings {:i {"<C-s>" "select_horizontal"}
                                        :n {"<C-s>" "select_horizontal"}}}
                  :pickers {:find_files {:find_command ["rg" "--files" "--iglob" "!.git" "--hidden"]}}
                  :extensions {:ui-select (themes.get_dropdown {})} })

(telescope.load_extension "ui-select")

(nvim.set_keymap :n :<leader>ff ":lua require('telescope.builtin').find_files()<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>fg ":lua require('telescope.builtin').live_grep()<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>fb ":lua require('telescope.builtin').buffers()<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>fh ":lua require('telescope.builtin').help_tags()<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>fc ":lua require('telescope.builtin').git_commits()<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>fr ":lua require('telescope.builtin').git_branches()<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>fs ":lua require('telescope.builtin').git_status()<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>fj ":lua require('telescope.builtin').jumplist()<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>fq ":lua require('telescope.builtin').quickfix()<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>fm ":lua require('telescope.builtin').marks()<CR>" {:noremap true})
