(module config.plugin.fern
  {autoload {nvim aniseed.nvim
             util config.util}
   require-macros [config.macros]})

(nvim.set_keymap :n :<leader>fe ":Fern . -reveal=%<cr>" {:noremap true :silent true})
; (util.set-global-variable :fern#renderer "nerdfont")

;; (nvim.ex.hi "FernBranch" "guifg=#FFF" "ctermfg=255")
;; (nvim.ex.hi "FernBranch" "guifg=#FFF" "ctermfg=255")
;; (nvim.ex.hi "LineNr" "guifg=#FFF" "ctermfg=255")

; (augroup color_fern_icons
  ; (nvim.ex.autocmd! "*")
  ; (autocmd :FileType :fern "call glyph_palette#apply()"))

; (autocmd :FileType :fern "call glyph_palette#apply()")

;(defn on-fern-load []
  ;(nvim.ex.hi "FernBranchText" "guifg=#e1e4e8")
  ;(nvim.ex.call "glyph_palette#apply()"))

;(augroup fern_color_fixes
  ;(nvim.ex.autocmd! "*")
  ;(autocmd :FileType :fern on-fern-load))
