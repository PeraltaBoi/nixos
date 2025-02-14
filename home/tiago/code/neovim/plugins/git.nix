{ ... }:

{
  programs.nixvim = {
    plugins = {
      diffview.enable = true;
      gitsigns.enable = true;
      neogit.enable = true;
    };

    keymaps = [
      {
        mode = "n";
        key = "<Leader>gg";
        action = ":Neogit<CR>";
        options = {
          silent = true;
          desc = "Open Neogit";
        };
      }
      {
        mode = "n";
        key = "<Leader>gb";
        action = ":Telescope git_branches<CR>";
        options = {
          silent = true;
          desc = "Git branches";
        };
      }
      {
        mode = "n";
        key = "<Leader>gc";
        action = ":Telescope git_commits<CR>";
        options = {
          silent = true;
          desc = "Git commits";
        };
      }
      {
        mode = "n";
        key = "<Leader>gs";
        action = ":Telescope git_status<CR>";
        options = {
          silent = true;
          desc = "Git status";
        };
      }
      {
        mode = "v";
        key = "<leader>hs";
        action.__raw =
          "function() require('gitsigns').stage_hunk({vim.fn.line('.'), vim.fn.line('v')}) end";
        options.desc = "stage git hunk";
      }
      {
        mode = "v";
        key = "<leader>hr";
        action.__raw =
          "function() require('gitsigns').reset_hunk({vim.fn.line('.'), vim.fn.line('v')}) end";
        options.desc = "reset git hunk";
      }
      # Normal mode mappings
      {
        mode = "n";
        key = "<leader>hs";
        action.__raw = "require('gitsigns').stage_hunk";
        options.desc = "git [s]tage hunk";
      }
      {
        mode = "n";
        key = "<leader>hr";
        action.__raw = "require('gitsigns').reset_hunk";
        options.desc = "git [r]eset hunk";
      }
      {
        mode = "n";
        key = "<leader>hS";
        action.__raw = "require('gitsigns').stage_buffer";
        options.desc = "git [S]tage buffer";
      }
      {
        mode = "n";
        key = "<leader>hu";
        action.__raw = "require('gitsigns').undo_stage_hunk";
        options.desc = "git [u]ndo stage hunk";
      }
      {
        mode = "n";
        key = "<leader>hR";
        action.__raw = "require('gitsigns').reset_buffer";
        options.desc = "git [R]eset buffer";
      }
      {
        mode = "n";
        key = "<leader>hp";
        action.__raw = "require('gitsigns').preview_hunk";
        options.desc = "git [p]review hunk";
      }
      {
        mode = "n";
        key = "<leader>hb";
        action.__raw = "require('gitsigns').blame_line";
        options.desc = "git [b]lame line";
      }
      {
        mode = "n";
        key = "<leader>hd";
        action.__raw = "require('gitsigns').diffthis";
        options.desc = "git [d]iff against index";
      }
      {
        mode = "n";
        key = "<leader>hD";
        action.__raw = "function() require('gitsigns').diffthis('@') end";
        options.desc = "git [D]iff against last commit";
      }
      # Toggle mappings
      {
        mode = "n";
        key = "<leader>tb";
        action.__raw = "require('gitsigns').toggle_current_line_blame";
        options.desc = "[T]oggle git show [b]lame line";
      }
      {
        mode = "n";
        key = "<leader>tD";
        action.__raw = "require('gitsigns').toggle_deleted";
        options.desc = "[T]oggle git show [D]eleted";
      }
    ];
  };
}
