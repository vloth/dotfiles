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
  ;plugin manager
  :wbthomason/packer.nvim {}

  ;nvim config and plugins in Fennel
  :Olical/aniseed {:branch :develop}

  ;clojure
  :Olical/conjure {:branch :master :mod :conjure}

  ;file explorer/search
  :kyazdani42/nvim-tree.lua {:mod :nvim-tree-lua
                             :requires [:kyazdani42/nvim-web-devicons]}
  :nvim-telescope/telescope.nvim {:requires [:nvim-lua/popup.nvim
                                             :nvim-lua/plenary.nvim
                                             :nvim-telescope/telescope-ui-select.nvim
                                             :kyazdani42/nvim-web-devicons]
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

  ;autocomplete / snip
  :hrsh7th/nvim-cmp {:requires [:hrsh7th/cmp-buffer
                                :hrsh7th/cmp-path
                                :hrsh7th/cmp-calc
                                :hrsh7th/cmp-nvim-lsp
                                :hrsh7th/cmp-nvim-lua
                                :hrsh7th/cmp-vsnip
                                :hrsh7th/vim-vsnip
                                :PaterJason/cmp-conjure]
                     :mod :cmp}

  ;theme
  :shaunsingh/moonlight.nvim {:mod :theme}

  ;comment
  :b3nj5m1n/kommentary {:mod :comment}

  ;bufferline
  :akinsho/bufferline.nvim {:mod :bufferline
                            :tag "v2.*"
                            :requires [:kyazdani42/nvim-web-devicons]})
