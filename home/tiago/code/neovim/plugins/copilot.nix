{ ... }:

{
  programs.nixvim = {
    plugins.copilot-lua = {
      enable = true;
      settings = {
        suggestion = {
          enabled = false;
          accept = false;
          auto_trigger = true;
          debounce = 75;
        };
        panel = { enabled = false; };
      };
    };
  };
}
