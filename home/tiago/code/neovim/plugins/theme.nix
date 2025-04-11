{ specialArgs, lib, ... }:

let
  inherit (specialArgs) theme transparent;
  themeConfigs = {
    catppuccin = {
      colorschemes.catppuccin = {
        enable = true;
        settings = {
          integrations = { blink_cmp = true; };
          transparent_background = transparent;
        };
      };
    };
    kanagawa = {
      colorschemes.kanagawa = {
        enable = true;
        settings = {
          transparent = transparent;
          colors = { theme = { all = { ui.bg_gutter = "none"; }; }; };
          overrides = ''
            function(colors)
              local theme = colors.theme
              return {
                -- Remove background from floating windows
                NormalFloat = { bg = "none" },
                FloatBorder = { bg = "none" },
                FloatTitle = { bg = "none" },
                -- Darker windows
                NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
                -- Popular plugins floating windows
                LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                
                -- Borderless Telescope
                TelescopeTitle = { fg = theme.ui.special, bold = true },
                TelescopePromptNormal = { bg = theme.ui.bg_p1 },
                TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
                TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
                TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
                TelescopePreviewNormal = { bg = theme.ui.bg_dim },
                TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
                
                -- Dark completion menu
                Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
                PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
                PmenuSbar = { bg = theme.ui.bg_m1 },
                PmenuThumb = { bg = theme.ui.bg_p2 },
              }
            end
          '';
          overridesLua = ''
            function(colors)
              local theme = colors.theme
              local makeDiagnosticColor = function(color)
                local c = require("kanagawa.lib.color")
                return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
              end

              return {
                DiagnosticVirtualTextHint  = makeDiagnosticColor(theme.diag.hint),
                DiagnosticVirtualTextInfo  = makeDiagnosticColor(theme.diag.info),
                DiagnosticVirtualTextWarn  = makeDiagnosticColor(theme.diag.warning),
                DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),
              }
            end
          '';
        };
      };
    };
    rose-pine = {
      colorschemes.rose-pine = {
        enable = true;
        settings = {
          variant = "dawn";
          styles.transparency = transparent;
        };
      };
    };
  };
in { programs.nixvim = themeConfigs.${theme} or themeConfigs.catppuccin; }
