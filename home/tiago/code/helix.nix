{ pkgs, ... }:

{
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
      theme = "catppuccin_mocha";
    };
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

      languages.language-server.rust-analyzer = {
        config = {
          cargo.features = "all";
          check.command = "clippy";
        };
      };
    };
  };
}

