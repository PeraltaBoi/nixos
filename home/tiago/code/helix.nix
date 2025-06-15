{ pkgs, specialArgs, ... }:

let
  inherit (specialArgs) theme transparent;

  themeMapping = {
    "rose-pine" = "rose_pine_dawn";
    "kanagawa" = "kanagawa";
    "catppuccin" = "catppuccin_mocha";
  };

  # Custom theme definitions
  customThemes = if transparent then {
    catppuccin_mocha = {
      inherits = "catppuccin_mocha";
      "ui.background" = "none";
      "ui.popup" = { bg = "none"; };
      "ui.popup.info" = { bg = "none"; };
      "ui.menu" = { bg = "none"; };
      "ui.menu.selected" = { bg = "#313244AA"; };
      "ui.statusline" = { bg = "none"; };
      "ui.statusline.inactive" = { bg = "none"; };
    };
    kanagawa = {
      inherits = "kanagawa";
      "ui.background" = "none";
      "ui.popup" = { bg = "none"; };
      "ui.popup.info" = { bg = "none"; };
      "ui.menu" = { bg = "none"; };
      "ui.menu.selected" = { bg = "#2D4F67AA"; };
      "ui.statusline" = { bg = "none"; };
      "ui.statusline.inactive" = { bg = "none"; };
    };
    rose_pine_dawn = {
      inherits = "rose_pine_dawn";
      "ui.background" = "none";
      "ui.popup" = { bg = "none"; };
      "ui.popup.info" = { bg = "none"; };
      "ui.menu" = { bg = "none"; };
      "ui.menu.selected" = { bg = "#dfdad9AA"; };
      "ui.statusline" = { bg = "none"; };
      "ui.statusline.inactive" = { bg = "none"; };
    };
  } else
    { };

  selectedTheme = themeMapping.${theme} or themeMapping.rose-pine;
in {
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      editor = {
        mouse = true;
        line-number = "relative";
        color-modes = true;
        # lsp = { display-inlay-hints = true; };
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
        indent-guides.render = true;
        inline-diagnostics = {
          cursor-line = "hint";
          other-lines = "hint";
        };
      };
    } // {
      theme = selectedTheme;
    };
    themes = customThemes;
    languages = {
      language = [
        {
          name = "java";
          language-servers = [ "jdtls" ];
        }
        {
          name = "typescript";
          language-servers = [
            "tailwindcss-language-server"
            "eslint"
            "typescript-language-server"
          ];
        }
        {
          name = "tsx";
          language-servers = [
            "tailwindcss-language-server"
            "eslint"
            "typescript-language-server"
          ];
        }
      ];

      language-server.eslint = {
        command = "vscode-eslint-language-server";
        args = [ "--stdio" ];
        config = {
          validate = "on";
          experimental = { useFlatConfig = false; };
          rulesCustomizations = [ ];
          run = "onType";
          problems = { shortenToSingleLine = false; };
          nodePath = "";
        };
      };

      language-server.jdtls = {
        command = "jdtls";
        args = [ "--jvm-arg=-javaagent:${pkgs.lombok}/share/java/lombok.jar" ];
      };

      language-server.omnisharp = {
        args = [ "--languageserver" ];
        timeout = 200000;
      };

    };
  };
}

