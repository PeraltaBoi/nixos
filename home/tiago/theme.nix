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
      gtkThemePackage = null;
      gnomeColorScheme = "prefer-light";
      iconThemeName = "MoreWaita";
      iconThemePackage = pkgs.morewaita-icon-theme;
      cursorThemeName = "Bibata-Modern-Ice";
      cursorThemePackage = pkgs.bibata-cursors;
      nvimColorscheme = "catppuccin-light";
      helixTheme = "catppuccin_latte";
      ghosttyTheme = "Catppuccin Latte";
      wallpaperPath = "~/Pictures/wallpapers/amber.png";
      wantsAdwGtk3 = true;
    };
    dark = {
      gtkThemeName = "Adwaita-dark";
      gtkThemePackage = null;
      gnomeColorScheme = "prefer-dark";
      iconThemeName = "MoreWaita";
      iconThemePackage = pkgs.morewaita-icon-theme;
      cursorThemeName = "Bibata-Modern-Ice";
      cursorThemePackage = pkgs.bibata-cursors;
      nvimColorscheme = "catppuccin";
      helixTheme = "catppuccin_mocha";
      ghosttyTheme = "Catppuccin Mocha";
      wallpaperPath = "~/Pictures/wallpapers/amber.png";
      wantsAdwGtk3 = true;
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

    # A read-only option to expose the full settings of the active theme.
    # This allows other modules to easily access theme-specific values.
    settings = lib.mkOption {
      type = lib.types.attrs;
      readOnly = true;
      default = currentThemeSettings;
      description = "The attribute set of the currently active theme.";
    };
  };

  config = {
    # Dynamically build the list of packages required by the *current* theme.
    # This avoids installing unused theme packages.
    home.packages =
      # Base packages needed for theming infrastructure
      [
        pkgs.adwaita-qt # For Qt apps to use Adwaita
        pkgs.libsForQt5.qt5ct # Qt5 configuration tool
      ]
      # Add packages from the current theme, filtering out any nulls.
      ++ lib.optionals currentThemeSettings.wantsAdwGtk3 [ pkgs.adw-gtk3 ]
      ++ (lib.filter (p: p != null) [
        currentThemeSettings.gtkThemePackage
        currentThemeSettings.iconThemePackage
        currentThemeSettings.cursorThemePackage
      ]);

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

    dconf.settings = {
      # This needs to be enabled for dconf settings to apply
      # If you're using Gnome or a GTK-based desktop, this is often desirable.
      # If not, you might omit this part or make it conditional.
      # enable = true;
      "org/gnome/desktop/interface" = {
        color-scheme = currentThemeSettings.gnomeColorScheme;
      };
    };

    qt = {
      enable = true;
      platformTheme = {
        name = "gtk";
        package = pkgs.libsForQt5.qt5ct;
      };
    };

    home.pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
      package = currentThemeSettings.cursorThemePackage;
      name = currentThemeSettings.cursorThemeName;
      size = 24;
    };

  };
}
