(module config.plugin.lspconfig
  {autoload {nvim aniseed.nvim
             lsp lspconfig
             cmplsp cmp_nvim_lsp}})

; (boolean (nvim.fn.has "nvim-0.5")) 

;symbols to show for lsp diagnostics
(vim.fn.sign_define "LspDiagnosticsSignError" {:text "" :texthl "LspDiagnosticsSignError"})
(vim.fn.sign_define "LspDiagnosticsSignWarning" {:text "" :texthl "LspDiagnosticsSignWarning"})
(vim.fn.sign_define "LspDiagnosticsSignInformation" {:text "כֿ" :texthl "LspDiagnosticsSignInformation"})
(vim.fn.sign_define "LspDiagnosticsSignHint" {:text "" :texthl "LspDiagnosticsSignHint"})

; (vim.fn.sign_define "DiagnosticSignError" {:text "" :texthl "DiagnosticSignError"})
; (vim.fn.sign_define "DiagnosticSignWarn" {:text "" :texthl "DiagnosticSignWarn"})
; (vim.fn.sign_define "DiagnosticSignInfo" {:text "כֿ" :texthl "DiagnosticSignInfo"})
; (vim.fn.sign_define "DiagnosticSignHint" {:text "" :texthl "DiagnosticSignHint"})

;server features
(let [handlers {"textDocument/publishDiagnostics"
                (vim.lsp.with
                  vim.lsp.diagnostic.on_publish_diagnostics
                  {:severity_sort true
                   :update_in_insert false
                   :underline true
                   :virtual_text false})
                "textDocument/hover"
                (vim.lsp.with
                  vim.lsp.handlers.hover
                  {:border "single"})
                "textDocument/signatureHelp"
                (vim.lsp.with
                  vim.lsp.handlers.signature_help
                  {:border "single"})}
      capabilities (cmplsp.update_capabilities (vim.lsp.protocol.make_client_capabilities))
      on_attach (fn [client bufnr]
                  (do
                    (nvim.buf_set_keymap bufnr :n :gd "<cmd>lua vim.lsp.buf.definition()<cr>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :K "<cmd>lua vim.lsp.buf.hover()<cr>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>ld "<cmd>lua vim.lsp.buf.declaration()<cr>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>lt "<cmd>lua vim.lsp.buf.type_definition()<cr>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>lh "<cmd>lua vim.lsp.buf.signature_help()<cr>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>ln "<cmd>lua vim.lsp.buf.rename()<cr>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>le "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>lq "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>lf "<cmd>lua vim.lsp.buf.formatting()<cr>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>lj "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>lk "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>" {:noremap true})
                    ;telescope
                    (nvim.buf_set_keymap bufnr :n :<leader>la ":lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_cursor())<cr>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :v :<leader>la ":'<,'>:Telescope lsp_range_code_actions theme=cursor<cr>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>lw ":lua require('telescope.builtin').lsp_workspace_diagnostics()<cr>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>lr ":lua require('telescope.builtin').lsp_references()<cr>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>li ":lua require('telescope.builtin').lsp_implementations()<cr>" {:noremap true})))]

  ;; Clojure
  (lsp.clojure_lsp.setup {:on_attach on_attach
                          :handlers handlers
                          :capabilities capabilities})
  
  
  ;; Typescript / Jacasript
  (lsp.tsserver.setup    {:on_attach on_attach
                          :handlers handlers
                          :capabilities capabilities})

  (lsp.eslint.setup {}))
