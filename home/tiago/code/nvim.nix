{ ... }:

{
  programs.nvf = {
    enable = true;
    # your settings need to go into the settings attribute set
    # most settings are documented in the appendix
    settings = {
      vim.viAlias = false;
      vim.vimAlias = true;

      vim.theme.name = "catppuccin";

      vim.telescope.enable = true;

      vim.autocomplete.nvim-cmp.enable = true;

      vim.lsp = { enable = true; };
      vim.languages = {
        enableLSP = true;
        enableTreesitter = true;
        nix.enable = true;
      };
    };
  };
}
