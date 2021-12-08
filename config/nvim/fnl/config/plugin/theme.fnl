(module config.plugin.theme
  {autoload {theme github-theme}})

(theme.setup {:theme_style "dark"
              :comment_style "italic"
              :colors {:bg "#000"
                       :bg_float "#19181e" }})
