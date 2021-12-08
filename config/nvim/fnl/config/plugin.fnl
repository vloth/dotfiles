(module config.plugin
  {autoload {nvim aniseed.nvim
             a aniseed.core
             util config.util
             packer packer}})

(defn- safe-require-plugin-config [name]
  (let [(ok? val-or-err) (pcall require (.. :config.plugin. name))]
    (when (not ok?)
      (print (.. "config error: " val-or-err)))))

(defn- use [...]
  "Iterates through the arguments as pairs and calls packer's use function for
  each of them. Works around Fennel not liking mixed associative and sequential
  tables as well."
  (let [pkgs [...]]
    (packer.startup
      (fn [use]
        (for [i 1 (a.count pkgs) 2]
          (let [name (. pkgs i)
                opts (. pkgs (+ i 1))]
            (-?> (. opts :mod) (safe-require-plugin-config))
            (use (a.assoc opts 1 name)))))))
  nil)

;plugins managed by packer
(use
  ;plugin Manager
  :wbthomason/packer.nvim {}

  ;nvim config and plugins in Fennel
  :Olical/aniseed {:branch :develop}

  ;clojure
  :Olical/conjure {:branch :master :mod :conjure}

  ;file explorer/search
  :lambdalisue/fern.vim {:mod :fern
                         :requires [:antoinemadec/FixCursorHold.nvim
                                    :lambdalisue/nerdfont.vim
                                    :lambdalisue/fern-renderer-nerdfont.vim
                                    :lambdalisue/glyph-palette.vim]}
  :nvim-telescope/telescope.nvim {:requires [:nvim-lua/popup.nvim
                                             :nvim-lua/plenary.nvim]
                                  :mod :telescope}

  ;parsing system
  :nvim-treesitter/nvim-treesitter {:run ":TSUpdate"
                                    :mod :treesitter}

  ;tmux
  :christoomey/vim-tmux-navigator {:mod :tmux-navigator}
  :melonmanchan/vim-tmux-resizer {}

  ;sexp
  :guns/vim-sexp {:mod :sexp}
  :tpope/vim-sexp-mappings-for-regular-people {}
  :tpope/vim-repeat {}
  :tpope/vim-surround {}

  ;lsp
  :neovim/nvim-lspconfig {:mod :lspconfig}

  ;autocomplete
  :hrsh7th/nvim-cmp {:requires [:hrsh7th/cmp-buffer
                                :hrsh7th/cmp-path
                                :hrsh7th/cmp-calc
                                :hrsh7th/cmp-nvim-lsp
                                :hrsh7th/cmp-nvim-lua
                                :hrsh7th/cmp-vsnip
                                :PaterJason/cmp-conjure]
                     :mod :cmp}
  ;theme
  :projekt0n/github-nvim-theme {:mod :theme})
