(module config.plugin.theme
  {autoload {util config.util
             nvim aniseed.nvim}})

; (let [settings {:moonlight_italic_keywords true
;                 :moonlight_italic_comments true
;                 :moonlight_italic_variables true
;                 :moonlight_italic_functions true
;                 :moonlight_disable_background false}]
;   (each [setting value (pairs settings)]
;     (util.set-global-variable setting value)))

(nvim.ex.colorscheme :nord)
