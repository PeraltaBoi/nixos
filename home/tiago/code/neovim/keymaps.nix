{ ... }:

{
  programs.nixvim = {
    globals.mapleader = " ";

    # https://nix-community.github.io/nixvim/NeovimOptions/autoGroups/index.html
    autoGroups = { kickstart-highlight-yank = { clear = true; }; };

    autoCmd = [
      # Highlight when yanking (copying) text
      #  Try it with `yap` in normal mode
      #  See `:help vim.highlight.on_yank()`
      {
        event = [ "TextYankPost" ];
        desc = "Highlight when yanking (copying) text";
        group = "kickstart-highlight-yank";
        callback.__raw = ''
          function()
            vim.highlight.on_yank()
          end
        '';
      }
    ];

    keymaps = [
      # {
      #   mode = "n";
      #   key = "<leader>e";
      #   options.silent = true;
      #   action = "<CMD>NvimTreeFocus<CR>";
      #   options = { desc = "NvimTr[E]e Focus"; };
      # }
      # Clear search highlights
      {
        mode = "n";
        key = "<Esc>";
        action = "<cmd>nohlsearch<CR>";
        options.desc = "Clear search highlights";
      }
      # Diagnostic quickfix list
      {
        mode = "n";
        key = "<leader>q";
        action = ":lua vim.diagnostic.setloclist()<CR>";
        options = {
          desc = "Open diagnostic [Q]uickfix list";
          silent = true;
        };
      }
      # Terminal mode escape
      {
        mode = "t";
        key = "<Esc><Esc>";
        action = "<C-\\><C-n>";
        options.desc = "Exit terminal mode";
      }
      # Window navigation
      {
        mode = "n";
        key = "<C-h>";
        action = "<C-w><C-h>";
        options.desc = "Move focus to the left window";
      }
      {
        mode = "n";
        key = "<C-l>";
        action = "<C-w><C-l>";
        options.desc = "Move focus to the right window";
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<C-w><C-j>";
        options.desc = "Move focus to the lower window";
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<C-w><C-k>";
        options.desc = "Move focus to the upper window";
      }
      # Disable CMD+Space in insert mode
      {
        mode = "i";
        key = "<D-Space>";
        action = "<Nop>";
        options.silent = true;
      }
    ];
  };
}
