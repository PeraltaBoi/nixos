{ ... }:

{
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      # theme="rose-pine-dawn";
      theme = "catppuccin-mocha";
      font-size = 15;
      font-family = ''"JetBrains Mono"'';
      font-style = "ExtraBold";
      font-style-bold = "ExtraBold";
      window-decoration = false;
      confirm-close-surface = false;
    };
  };
}
