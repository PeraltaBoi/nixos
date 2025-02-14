{ ... }:

{
  programs.nixvim = {
    colorschemes.catppuccin = {
      enable = true;
      settings = { integrations = { blink_cmp = true; }; };
    };
  };
}
