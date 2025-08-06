{ pkgs, ... }:

{
  home.packages = with pkgs; [
    hyprsunset
    hyprshot
    whitesur-gtk-theme
  ];

  programs.kitty.enable = true; # required for the default Hyprland config
  wayland.windowManager.hyprland = {
    enable = true; # enable Hyprland
    extraConfig = ''
      animations {
          enabled = true
          bezier = linear, 0, 0, 1, 1
          bezier = md3_standard, 0.2, 0, 0, 1
          bezier = md3_decel, 0.05, 0.7, 0.1, 1
          bezier = md3_accel, 0.3, 0, 0.8, 0.15
          bezier = overshot, 0.05, 0.9, 0.1, 1.1
          bezier = crazyshot, 0.1, 1.5, 0.76, 0.92 
          bezier = hyprnostretch, 0.05, 0.9, 0.1, 1.0
          bezier = fluent_decel, 0.1, 1, 0, 1
          bezier = easeInOutCirc, 0.85, 0, 0.15, 1
          bezier = easeOutCirc, 0, 0.55, 0.45, 1
          bezier = easeOutExpo, 0.16, 1, 0.3, 1
          animation = windows, 1, 3, md3_decel, popin 60%
          animation = border, 1, 10, default
          animation = fade, 1, 2.5, md3_decel
          animation = workspaces, 1, 3.5, easeOutExpo, slide
          animation = specialWorkspace, 1, 3, md3_decel, slidevert
      }
      			'';
    settings = {
      "$mainMod" = "SUPER";
      "$terminal" = "ghostty";
      "$fileManager" = "nautilus";
      "$browser" = "firefox";
      "$menu" = "fuzzel";

      bindm = [
        "bindm = $mainMod, mouse:272, movewindow"
        "bindm = $mainMod, mouse:273, resizewindow"
      ];

      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ];

      bind = [
        "$mainMod, P, exec, $browser"
        "$mainMod SHIFT, P, exec, $browser --private-window"
        "$mainMod, RETURN, exec, $terminal"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, R, exec, $menu"
        "$mainMod SHIFT, S, exec, hyprshot -m region --freeze"
        "$mainMod, F, fullscreen"
        "$mainMod, Q, killactive"
        "$mainMod, M, exit"
        "$mainMod, A, togglefloating"
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        "$mainMod, h, movefocus, l"
        "$mainMod, l, movefocus, r"
        "$mainMod, k, movefocus, u"
        "$mainMod, j, movefocus, d"
      ]
      ++ (
        # workspaces
        # binds $mainMod + [shift +] {1..9} to [move to] workspace {1..9}
        builtins.concatLists (
          builtins.genList (
            i:
            let
              ws = i + 1;
            in
            [
              "$mainMod, code:1${toString i}, workspace, ${toString ws}"
              "$mainMod SHIFT, code:1${toString i}, movetoworkspacesilent, ${toString ws}"
            ]
          ) 9
        )
      );

      monitor = [
        "DP-1,2560x1440@155,1920x2160,1"
        "HDMI-A-1,1920x1080@60,0x2160,1"
        "monitor=DP-2,preferred,0x0,auto"
      ];

      exec-once = [
        "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"
        # "wlsunset -l 38.7 -L 9.1"
        "hyprsunset"
        "hyprctl setcursor Bibata-Modern-Ice 24"
        "xrandr --output DP-1 --primary"
        "exec-once = wl-paste --type text --watch cliphist store # Stores only text data"
        "exec-once = wl-paste --type image --watch cliphist store # Stores only image data"
        "exec-once = wl-clip-persist --clipboard regular"
      ];

      workspace = [
        "1,monitor:DP-1"
        "2,monitor:DP-1"
        "3,monitor:DP-1"
        "4,monitor:DP-1"
        "5,monitor:DP-1"
        "6,monitor:DP-1"
        "7,monitor:DP-1"
        "8,monitor:DP-1"
        "9,monitor:HDMI-A-1"
        "10,monitor:DP-2"
      ];

      input = {
        kb_layout = "us,pt";
        kb_options = "grp:win_space_toggle";
        follow_mouse = true;
        force_no_accel = true;
        # sensitivity = -0.5;
      };

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 3;
        no_border_on_floating = false;
        resize_on_border = false;
        allow_tearing = false;
        # todo: colors
      };

      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
          size = 2;
          passes = 5;
          # size = 10;
          # passes = 3;
          new_optimizations = true;
          ignore_opacity = true;
          noise = 0;
          brightness = 0.9;
          xray = true;
          # blurls = waybar
        };

        shadow = {
          enabled = false;
        };
      };

      misc = {
        disable_hyprland_logo = true;
      };
    };
  };
  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
  };

  # programs.firefox = {
  #   enable = true;
  #   profiles.default = {
  #     settings = {
  #       "font.name.serif.x-western" = "JetBrains Mono";
  #       "font.name.sans-serif.x-western" = "Adwaita Sans";
  #       "font.name.monospace.x-western" = "Monospace";
  #       # "font.size.variable.x-western" = 16;
  #       # "font.size.monospace.x-western" = 14;
  #     };
  #   };
  # };

  gtk = {
    enable = true;

    iconTheme = {
      package = pkgs.morewaita-icon-theme;
      name = "MoreWaita";
    };
  };

  catppuccin = {
    # enable = true;
    # gtk.enable = true;
    nushell.enable = true;
    helix.enable = false;
    flavor = "mocha";
  };
}
