{ ... }:

{
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      theme = "catppuccin-mocha";
      font-size = 15;
      font-family = ''"JetBrains Mono"'';
      font-style = "ExtraBold";
      font-style-bold = "ExtraBold";
      window-decoration = false;
      confirm-close-surface = false;
      background-opacity = 1.0;

      adjust-box-thickness = "200%";

      # Window padding settings
      window-padding-x = 15; # 15 points padding on left and right
      window-padding-y = 5; # 15 points padding on top and bottom
      window-padding-balance = true; # Distribute extra space evenly
    };
  };
}
