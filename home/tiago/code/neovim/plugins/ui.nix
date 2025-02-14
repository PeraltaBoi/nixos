{ ... }:

{
  programs.nixvim = {
    plugins = {
      dressing.enable = true;
      nui.enable = true;
      noice.enable = true;
      fidget.enable = true;
      todo-comments.enable = true;
      dropbar.enable = true;
      notify = {
        enable = true;
        render = "wrapped-compact";
        maxWidth = 60;
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>;";
        action = "require('dropbar.api').pick";
        lua = true;
        options = {
          silent = true;
          desc = "Pick symbols in winbar";
        };
      }
      {
        mode = "n";
        key = "[;";
        action = "require('dropbar.api').goto_context_start";
        lua = true;
        options = {
          silent = true;
          desc = "Go to start of current context";
        };
      }
      {
        mode = "n";
        key = "];";
        action = "require('dropbar.api').select_next_context";
        lua = true;
        options = {
          silent = true;
          desc = "Select next context";
        };
      }
    ];
  };
}
