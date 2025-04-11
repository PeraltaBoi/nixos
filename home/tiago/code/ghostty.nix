{ specialArgs, ... }:

let
  inherit (specialArgs) theme transparent;
  themeMapping = {
    "rose-pine" = "rose-pine-dawn";
    "kanagawa" = "Kanagawa Wave";
    "catppuccin" = "catppuccin-mocha";
  };
  selectedTheme = themeMapping.${theme} or "Catppuccin Mocha";
in {
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      theme = selectedTheme;
      font-size = 15;
      font-family = ''"JetBrains Mono"'';
      font-style = "ExtraBold";
      font-style-bold = "ExtraBold";
      window-decoration = false;
      confirm-close-surface = false;
      background-opacity = if transparent then 0.8 else 1.0;

      adjust-box-thickness = "200%";

      # Window padding settings
      window-padding-x = 15; # 15 points padding on left and right
      window-padding-y = 5; # 15 points padding on top and bottom
      window-padding-balance = true; # Distribute extra space evenly
    };
  };
}
