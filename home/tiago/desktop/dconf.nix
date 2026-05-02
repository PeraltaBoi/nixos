{ pkgs, ... }: {
  home.packages = with pkgs; [
    adw-gtk3
    gnome-tweaks
    gnomeExtensions.user-themes
    gnomeExtensions.dash-to-dock
    gnomeExtensions.blur-my-shell
    gnomeExtensions.appindicator
  ];

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      # color-scheme = "catppuccin";
      font-name = "Adwaita Sans 11";
      monospace-font-name = "Adwaita Mono 11";
      document-font-name = "Adwaita Sans 11";
    };

    "org/gnome/desktop/input-sources" = {
      sources = [ [ "xkb" "us" ] [ "xkb" "pt" ] ];
    };

    "org/gnome/desktop/background" = {
      picture-uri =
        "file:///run/current-system/sw/share/backgrounds/gnome/amber-l.jxl";
      picture-uri-dark =
        "file:///run/current-system/sw/share/backgrounds/gnome/amber-d.jxl";
      primary-color = "#ff7800";
    };

    "org/gnome/desktop/screensaver" = {
      picture-uri =
        "file:///run/current-system/sw/share/backgrounds/gnome/amber-l.jxl";
      primary-color = "#ff7800";
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "close:appmenu";
      # workspace-names = [ "Main" "Web" "Code" "Media" ];
      num-workspaces = 10;
      focus-mode = "sloppy";
      resize-with-right-button = true;
    };

    "org/gnome/desktop/wm/keybindings" = {
      switch-applications = [ ]; # Disable default Alt-Tab for applications
      switch-applications-backward =
        [ ]; # Disable default Shift-Alt-Tab for applications
      switch-windows = [ "<Alt>Tab" ]; # Enable Alt-Tab for windows
      switch-windows-backward =
        [ "<Shift><Alt>Tab" ]; # Enable Shift-Alt-Tab for windows
      switch-to-workspace-1 = [ "<Super>1" ];
      switch-to-workspace-2 = [ "<Super>2" ];
      switch-to-workspace-3 = [ "<Super>3" ];
      switch-to-workspace-4 = [ "<Super>4" ];
      switch-to-workspace-5 = [ "<Super>5" ];
      switch-to-workspace-6 = [ "<Super>6" ];
      switch-to-workspace-7 = [ "<Super>7" ];
      switch-to-workspace-8 = [ "<Super>8" ];
      switch-to-workspace-9 = [ "<Super>9" ];
      switch-to-workspace-10 = [ "<Super>0" ];
      move-to-workspace-1 = [ "<Super><Shift>1" ];
      move-to-workspace-2 = [ "<Super><Shift>2" ];
      move-to-workspace-3 = [ "<Super><Shift>3" ];
      move-to-workspace-4 = [ "<Super><Shift>4" ];
      move-to-workspace-5 = [ "<Super><Shift>5" ];
      move-to-workspace-6 = [ "<Super><Shift>6" ];
      move-to-workspace-7 = [ "<Super><Shift>7" ];
      move-to-workspace-8 = [ "<Super><Shift>8" ];
      move-to-workspace-9 = [ "<Super><Shift>9" ];
      move-to-workspace-10 = [ "<Super><Shift>0" ];
    };

    "org/gnome/shell/keybindings" = {
      show-screenshot-ui = [ "<Shift><Super>s" ];
    };

    "org/gnome/shell" = {
      # Enable/disable extensions
      enabled-extensions = [
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "dash-to-dock@micxgx.gmail.com"
        "appindicatorsupport@rgcjonas.gmail.com"
        "blur-my-shell@aunetx"
      ];
      disabled-extensions = [ ];
      favorite-apps = [
        "firefox.desktop"
        "org.gnome.Terminal.desktop"
        "org.gnome.Nautilus.desktop"
      ];
    };

    # Dash to Dock extension settings
    "org/gnome/shell/extensions/dash-to-dock" = {
      dock-position = "BOTTOM";
      dock-fixed = false;
      show-show-apps-button = false;
      show-trash = false;
      show-mounts = false;
      hot-keys = false;
      intellihide-mode = "ALL_WINDOWS";
      running-indicator-style = "DOTS";
      transparency-mode = "DEFAULT";
      dash-max-icon-size = 48;
    };

    # Blur my Shell extension settings
    "org/gnome/shell/extensions/blur-my-shell" = {
      sigma = 30;
      brightness = 0.6;
    };

    # Night Light settings
    "org/gnome/settings-daemon/plugins/color" = { night-light-enabled = true; };
  };

}
