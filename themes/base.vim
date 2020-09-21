exe 'hi EndOfBuffer  ctermfg=' . g:theme_bg
exe 'hi VertSplit    ctermfg=' . g:theme_bg
exe 'hi LineNr       ctermfg=' . g:theme_neutral . ' ctermbg=NONE'
exe 'hi StatusLine   ctermfg=' . g:theme_bg      . ' ctermbg=' . g:theme_accent1
exe 'hi StatusLineNC ctermfg=' . g:theme_bg      . ' ctermbg=' . g:theme_neutral
exe 'hi SignColumn   ctermbg=' . 'NONE'
exe 'hi Folded       ctermbg=' . 'NONE'          . ' cterm=italic'

exe 'hi Visual    ctermbg=' . g:theme_neutral2
exe 'hi Search    ctermfg=' . g:theme_black   . ' ctermbg=' . g:theme_accent2
exe 'hi IncSearch ctermbg=' . g:theme_black   . ' ctermfg=' . g:theme_accent2
exe 'hi Comment   ctermfg=' . g:theme_neutral

exe 'hi CocErrorSign    ctermfg=' . g:theme_error . ' ctermbg=' . g:theme_bg
exe 'hi CocWarningSign  ctermfg=' . g:theme_warn  . ' ctermbg=' . g:theme_bg
exe 'hi CocInfoSign     ctermfg=' . g:theme_info  . ' ctermbg=' . g:theme_bg
exe 'hi CocFloating     ctermbg=' . g:theme_black
exe 'hi CocErrorFloat   ctermbg=' . g:theme_black . ' ctermfg=' . g:theme_error
exe 'hi CocWarningFloat ctermbg=' . g:theme_black . ' ctermfg=' . g:theme_warn
exe 'hi CocInfoFloat    ctermbg=' . g:theme_black . ' ctermfg=' . g:theme_info

exe 'hi GitGutterAdd           ctermfg=' . g:theme_success . ' ctermbg='     . g:theme_bg
exe 'hi GitGutterChange        ctermfg=' . g:theme_info    . ' ctermbg='     . g:theme_bg
exe 'hi GitGutterDelete        ctermfg=' . g:theme_error   . ' ctermbg='     . g:theme_bg
exe 'hi GitGutterChangeDelete  ctermfg=' . g:theme_warn    . ' ctermbg='     . g:theme_bg

exe 'hi TabLine     ctermfg=' . g:theme_neutral . ' ctermbg=' . g:theme_bg . ' cterm=' . 'NONE'
exe 'hi TabLineSel  ctermfg=' . g:theme_accent1 . ' ctermbg=' . 'NONE'
exe 'hi TabLineFill ctermfg=' . g:theme_bg
exe 'hi PmenuSel    ctermfg=' . g:theme_neutral2 . ' ctermbg=' . g:theme_bg
exe 'hi Pmenu       ctermfg=' . g:theme_neutral2 . ' ctermbg=' . g:theme_black

function! s:update_fzf_colors()
  let rules =
  \ { 'fg':      [['Normal',       'fg']],
    \ 'bg':      [['Normal',       'bg']],
    \ 'hl':      [['IncSearch',    'fg']],
    \ 'fg+':     [['StatusLine',   'bg']],
    \ 'bg+':     [['Search',       'fg']],
    \ 'hl+':     [['Statement',    'fg']],
    \ 'info':    [['PreProc',      'fg']],
    \ 'prompt':  [['Conditional',  'fg']],
    \ 'pointer': [['Exception',    'fg']],
    \ 'marker':  [['Keyword',      'fg']],
    \ 'spinner': [['Label',        'fg']],
    \ 'header':  [['Comment',      'fg']] }
  let cols = []
  for [name, pairs] in items(rules)
    for pair in pairs
      let code = synIDattr(synIDtrans(hlID(pair[0])), pair[1])
      if !empty(name) && code > 0
        call add(cols, name.':'.code)
        break
      endif
    endfor
  endfor
  let s:orig_fzf_default_opts = get(s:, 'orig_fzf_default_opts', $FZF_DEFAULT_OPTS)
  let $FZF_DEFAULT_OPTS = s:orig_fzf_default_opts .
        \ empty(cols) ? '' : (' --color='.join(cols, ','))
 endfunction
 
 autocmd VimEnter,ColorScheme * call s:update_fzf_colors()
