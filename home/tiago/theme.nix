# ~/.config/home-manager/modules/theme.nix
{
  config,
  pkgs,
  lib,
  ...
}:

let
  themeDefinitions = {
    light = {
      gtkThemeName = "Adwaita";
      gtkThemePackage = pkgs.adwaita-qt;
      iconThemeName = "Adwaita";
      iconThemePackage = pkgs.adwaita-icon-theme;
      cursorThemeName = "Adwaita";
      cursorThemePackage = pkgs.adwaita-qt;
      terminalColors = import ../../colorschemes/base16-solarized-light.nix; # Relative path from module
      nvimColorscheme = "solarized";
      wallpaperPath = "/path/to/your/light_wallpaper.png";
    };
    dark = {
      gtkThemeName = "Adwaita-dark";
      gtkThemePackage = pkgs.adwaita-qt;
      iconThemeName = "Papirus";
      iconThemePackage = pkgs.papirus-icon-theme;
      cursorThemeName = "Bibata-Modern-Classic";
      cursorThemePackage = pkgs.bibata-cursors;
      terminalColors = import ../../colorschemes/base16-gruvbox-dark-hard.nix;
      nvimColorscheme = "gruvbox";
      wallpaperPath = "/path/to/your/dark_wallpaper.png";
    };
  };

  currentThemeSettings = themeDefinitions.${config.systemTheme.name};

in
{
  options.systemTheme = {
    name = lib.mkOption {
      type = lib.types.enum (lib.attrNames themeDefinitions);
      default = "dark"; # <<<--- STILL THE SINGLE SOURCE OF TRUTH DEFAULT
      description = "The global theme to apply.";
    };
  };

  config = {
    gtk = {
      enable = true;
      theme = {
        name = currentThemeSettings.gtkThemeName;
        package = currentThemeSettings.gtkThemePackage;
      };
      iconTheme = {
        name = currentThemeSettings.iconThemeName;
        package = currentThemeSettings.iconThemePackage;
      };
      cursorTheme = {
        name = currentThemeSettings.cursorThemeName;
        package = currentThemeSettings.cursorThemePackage;
      };
    };

    qt = {
      enable = true;
      platformTheme = {
        name = "gtk";
        package = pkgs.libsForQt5.qt5ct;
      };
    };

    systemTheme.settings = currentThemeSettings;
  };

  home.packages = with pkgs; [
    adwaita-qt
    adwaita-icon-theme
    papirus-icon-theme
    bibata-cursors
    libsForQt5.qt5ct
  ];
}
