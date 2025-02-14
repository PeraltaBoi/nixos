{ ... }:

{
  programs.nixvim = {
    plugins.trouble.enable = true;

    keymaps = [
      {
        mode = "n";
        key = "<leader>xx";
        action = ":Trouble diagnostics toggle<CR>";
        options = {
          silent = true;
          desc = "Diagnostics (Trouble)";
        };
      }
      {
        mode = "n";
        key = "<leader>xX";
        action = ":Trouble diagnostics toggle filter.buf=0<CR>";
        options = {
          silent = true;
          desc = "Buffer Diagnostics (Trouble)";
        };
      }
      {
        mode = "n";
        key = "<leader>cs";
        action = ":Trouble symbols toggle focus=false<CR>";
        options = {
          silent = true;
          desc = "Symbols (Trouble)";
        };
      }
      {
        mode = "n";
        key = "<leader>cl";
        action = ":Trouble lsp toggle focus=false win.position=right<CR>";
        options = {
          silent = true;
          desc = "LSP Definitions / references / ... (Trouble)";
        };
      }
      {
        mode = "n";
        key = "<leader>xL";
        action = ":Trouble loclist toggle<CR>";
        options = {
          silent = true;
          desc = "Location List (Trouble)";
        };
      }
      {
        mode = "n";
        key = "<leader>xQ";
        action = ":Trouble qflist toggle<CR>";
        options = {
          silent = true;
          desc = "Quickfix List (Trouble)";
        };
      }
    ];
  };
}
