{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraLuaConfig = ''
      -- disable netrw at the very start of your init.lua
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      -- optionally enable 24-bit colour
      -- vim.opt.termguicolors = true

      vim.opt.clipboard:append('unnamedplus')










      require("nvim-tree").setup()

      -- vim.cmd.colorscheme "catppuccin-mocha"
      -- vim.cmd.colorscheme "tokyonight-storm"
      -- Set line numbers and relative line numbers
      vim.opt.number = true
      vim.opt.relativenumber = true

      -- Set the leader key to space
      vim.g.mapleader = " "

      -- Map <leader>e to toggle NvimTree 
      vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })



    '';

    plugins = with pkgs; [
      vimPlugins.nvim-tree-lua
      vimPlugins.nvim-web-devicons
      vimPlugins.nui-nvim
      vimPlugins.plenary-nvim
      vimPlugins.fidget-nvim
      vimPlugins.which-key-nvim
      vimPlugins.telescope-nvim
      vimPlugins.toggleterm-nvim
      vimPlugins.catppuccin-nvim
      # vimPlugins.transparent-nvim
      vimPlugins.lualine-nvim
      {
        plugin = vimPlugins.tokyonight-nvim;
        type = "lua";
        config = ''
                    		require('tokyonight').setup({
                               	  transparent = true,
                               	  styles = {
                                 	    sidebars = "transparent",
                                 	    floats = "transparent",
                               	  },
                             	})
          			vim.cmd.colorscheme "tokyonight-storm"
                                        		'';
      }
      # vimPlugins.nvim-treesitter.withAllGrammars
      (vimPlugins.nvim-treesitter.withPlugins (p: [
        p.c
        p.java
        p.nix
        p.rust
      ]))
      {
        plugin = vimPlugins.nvim-lspconfig;
        type = "lua";
        config = ''
          	local lspconfig = require('lspconfig')

          	lspconfig.tsserver.setup{}
                	lspconfig.svelte.setup{}
                	lspconfig.nil_ls.setup({
          	  settings = {
          	    ['nil'] = {
                        formatting = {
                          command = { "nixfmt" },
                        },
                      },
                  },})
                	lspconfig.nixd.setup{}
          	'';
      }
      {
        plugin = vimPlugins.conform-nvim;
        type = "lua";
        config = ''
                	require("conform").setup({
                  	  formatters_by_ft = {
                    	    -- lua = { "stylua" },
          -- Conform will run multiple formatters sequentially
                    	    -- python = { "isort", "black" },
                    	    -- You can customize some of the format options for the filetype (:help conform.format)
                    	    -- rust = { "rustfmt", lsp_format = "fallback" },
                    	    -- Conform will run the first available formatter
                    	    -- javascript = { "prettierd", "prettier", stop_after_first = true },
                	    nix = { "nixfmt", lsp_format = "fallback" },
                  	  },
                	})
                	vim.api.nvim_set_keymap('n', '<leader>fc', ':lua require("conform").format()<CR>', { noremap = true, silent = true })

        '';
      }
    ];

    extraPackages = with pkgs; [
      typescript
      typescript-language-server
      svelte-language-server
      nil
      nixd
      nixfmt-rfc-style
    ];
  };
}
