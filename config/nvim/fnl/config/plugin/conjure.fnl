(module config.plugin.conjure
  {autoload {nvim aniseed.nvim
             util config.util}
   require-macros [config.macros]})

(set nvim.g.conjure#mapping#doc_word "K")
; (set nvim.g.conjure#client#clojure#nrepl#eval#auto_require false)
; (set nvim.g.conjure#client#clojure#nrepl#connection#auto_repl#enabled false)

(defn clerk-show []
  (let [src-path (util.expand "%")
        conjure-eval (.. "ConjureEval (nextjournal.clerk/show! \"" src-path "\")")]
  (vim.api.nvim_command "write")
  (vim.api.nvim_command conjure-eval)))

(nvim.set_keymap :n :<leader>cs (viml->fn "clerk-show") {:noremap true :silent true})

; zprint binding
(vim.api.nvim_command "nmap Z !a(zprint<CR>")

