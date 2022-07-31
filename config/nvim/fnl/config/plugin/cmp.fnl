(module config.plugin.cmp
  {autoload {nvim aniseed.nvim
             util config.util
             cmp cmp}})

(def- cmp-src-menu-items
  {:buffer "buff"
   :calc "calc"
   :conjure "conj"
   :nvim_lsp "lsp"
   :path "path"
   :vsnip "vsnp"})

(def- cmp-srcs
  [{:name :nvim_lsp}
   {:name :conjure}
   {:name :buffer}
   {:name :path}
   {:name :nvim_lua}
   {:name :vsnip}
   {:name :calc}])

;; Setup cmp with desired settings
(cmp.setup {:formatting
            {:format (fn [entry item]
                       (set item.menu (or (. cmp-src-menu-items entry.source.name) ""))
                       item)}
            :mapping {:<C-p> (cmp.mapping.select_prev_item)
                      :<C-n> (cmp.mapping.select_next_item)
                      :<C-d> (cmp.mapping.scroll_docs (- 4))
                      :<C-f> (cmp.mapping.scroll_docs 4)
                      :<C-Space> (cmp.mapping.complete)
                      :<C-e> (cmp.mapping.close)
                      :<CR> (cmp.mapping.confirm {:behavior cmp.ConfirmBehavior.Insert
                                                  :select true})}
            :snippet {:expand (fn [args]
                                (vim.fn.vsnip#anonymous args.body))}
            :sources cmp-srcs})

(nvim.ex.hi "CmpItemMenu ctermfg=7 guifg=#b1b1b1")
