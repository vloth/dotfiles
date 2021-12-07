(module config.plugin.theme
  {autoload {theme github-theme}})

(theme.setup {:theme_style "dark"
              :transparent true
              :hide_end_of_buffer true
              :hide_inactive_statusline true
              :comment_style "italic"})
