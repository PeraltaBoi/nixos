{ ... }:

{
  programs.nixvim = {
    plugins = {
      nvim-autopairs.enable = true;
      ts-autotag.enable = true;
      sleuth.enable = true;
      oil.enable = true;
      alpha = {
        enable = true;
        theme = "theta";
      };
    };
    keymaps = [
      {
        mode = "n";
        key = "-";
        action = ":Oil<CR>";
        options = {
          silent = true;
          desc = "Open parent directory with Oil";
        };
      }
      {
        mode = "n";
        key = "<leader>e";
        action = ":Oil<CR>";
        options = {
          silent = true;
          desc = "Open parent directory with Oil";
        };
      }
    ];
  };
}
