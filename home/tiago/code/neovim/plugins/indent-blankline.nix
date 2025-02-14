{ ... }:

{
  programs.nixvim = {
    plugins.indent-blankline = {
      enable = true;
      settings = {
        indent = {
          tab_char = "▎";
          priority = 2;
        };
      };
    };
  };
}
