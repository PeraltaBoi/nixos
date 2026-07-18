{
  helix-steel,
  config,
  pkgs,
  ...
}:
{
  programs.helix = {
    enable = true;
    # package = pkgs.steelix;
    package = (
      helix-steel.packages.${pkgs.system}.default.overrideAttrs (oldAttrs: {
        cargoBuildFlags = (oldAttrs.cargoBuildFlags or [ ]) ++ [
          "--features"
          "steel,git"
        ];
      })
    );
    # package = pkgs.helix;
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
      theme = config.systemTheme.settings.helixTheme;
      keys.normal = {
        space.e = [
          ":sh rm -f /tmp/unique-file-h21a434"
          ":insert-output yazi '%{buffer_name}' --chooser-file=/tmp/unique-file-h21a434"
          ":sh printf '\x1b[?1049h\x1b[?2004h' > /dev/tty"
          ":open %sh{cat /tmp/unique-file-h21a434}"
          ":redraw"
        ];
      };
    };
    languages = {
      language = [
        {
          name = "java";
          language-servers = [ "jdtls" ];
        }
        {
          name = "steel";
          language-servers = [ "steel-language-server" ];
          scope = "source.steel";
          injection-regex = "steel";
          file-types = [ "scm" ];
          grammar = "scheme";
        }
        {
          name = "typescript";
          language-servers = [
            "oxfmt"
            "oxlint"
            "tailwindcss-language-server"
            "eslint"
            "typescript-language-server"
          ];
        }
        {
          name = "tsx";
          language-servers = [
            "oxfmt"
            "oxlint"
            "tailwindcss-language-server"
            "eslint"
            "typescript-language-server"
          ];
        }
      ];

      language-server = {
        eslint = {
          command = "vscode-eslint-language-server";
          args = [ "--stdio" ];
          config = {
            validate = "on";
            experimental = {
              useFlatConfig = false;
            };
            rulesCustomizations = [ ];
            run = "onType";
            problems = {
              shortenToSingleLine = false;
            };
            nodePath = "";
          };
        };

        oxlint = {
          command = "oxlint";
          args = [ "--lsp" ];
        };

        oxfmt = {
          command = "oxfmt";
          args = [ "--lsp" ];
        };

        jdtls = {
          command = "jdtls";
          args = [ "--jvm-arg=-javaagent:${pkgs.lombok}/share/java/lombok.jar" ];
        };

        omnisharp = {
          args = [ "--languageserver" ];
          timeout = 200000;
        };

        rust-analyzer = {
          config = {
            cargo.features = "all";
            check.command = "clippy";
          };
        };

        qmlls = {
          args = [ "-E" ];
        };

        steel-language-server = {
          command = "steel-language-server";
        };
      };
    };
  };
}
