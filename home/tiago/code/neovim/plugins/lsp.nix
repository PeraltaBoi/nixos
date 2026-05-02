{ pkgs, ... }:

{
  programs.nixvim = {
    extraPlugins = [ pkgs.vimPlugins.Ionide-vim ];

    plugins.conform-nvim = {
      enable = true;
      settings = {
        notify_on_error = false;
        format_on_save = ''
          function(bufnr)
            -- Disable "format_on_save lsp_fallback" for lanuages that don't
            -- have a well standardized coding style. You can add additional
            -- lanuages here or re-enable it for the disabled ones.
            local disable_filetypes = { c = true, cpp = true }
            return {
              timeout_ms = 500,
              lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype]
            }
          end
        '';
        formatters_by_ft = {
          lua = [ "stylua" ];
          nix = [ "nixfmt" ];
          rust = [ "rustfmt" ];
          # Conform can also run multiple formatters sequentially
          # python = [ "isort "black" ];
          #
          # You can use a sublist to tell conform to run *until* a formatter
          # is found
          javascript = {
            __unkeyed-1 = "prettierd";
            __unkeyed-2 = "prettier";
            stop_after_first = true;
          };
          javascriptreact = {
            __unkeyed-1 = "prettierd";
            __unkeyed-2 = "prettier";
            stop_after_first = true;
          };
          typescript = {
            __unkeyed-1 = "prettierd";
            __unkeyed-2 = "prettier";
            stop_after_first = true;
          };
          typescriptreact = {
            __unkeyed-1 = "prettierd";
            __unkeyed-2 = "prettier";
            stop_after_first = true;
          };
          svelte = {
            __unkeyed-1 = "prettierd";
            __unkeyed-2 = "prettier";
            stop_after_first = true;
          };
        };
      };
    };

    plugins.lsp = {
      enable = true;
      inlayHints = false;
      servers = {
        nixd = {
          enable = true;
        };
        rust_analyzer = {
          enable = true;
          settings = {
            # try to get clippy here
          };
          # installRustc = false;
          # installCargo = false;
        };
        jsonls = {
          enable = true;
        };
        ts_ls = {
          enable = true;
        };
        eslint = {
          enable = true;
        };
        html = {
          enable = true;
        };
        tailwindcss = {
          enable = true;
        };
        svelte = {
          enable = true;
        };
        protols = {
          enable = true;
        };
        omnisharp = {
          enable = true;
        };
        hls = {
          enable = true;
        };
        jdtls = {
          enable = true;
          settings = {
            java = {
              jdt.ls = {
                vmargs = [
                  "--jvm-arg=-javaagent:${pkgs.lombok}/share/java/lombok.jar"
                  ".. -javaagent:${pkgs.lombok}/share/java/lombok.jar"
                  "-XX:+UseParallelGC"
                  "-XX:GCTimeRatio=4"
                  "-XX:AdaptiveSizePolicyWeight=90"
                  "-Dsun.zip.disableMemoryMapping=true"
                  "-Xmx1G"
                  "-Xms100m"
                  "--add-modules=ALL-SYSTEM"
                  "--add-opens"
                  "java.base/java.util=ALL-UNNAMED"
                  "--add-opens"
                  "java.base/java.lang=ALL-UNNAMED"
                ];
              };
            };
          };
        };
      };
    };

    keymaps = [
      {
        mode = "";
        key = "<leader>f";
        action.__raw = ''
          function()
            require('conform').format { async = true, lsp_fallback = true }
          end
        '';
        options = {
          desc = "[F]ormat buffer";
        };
      }
      {
        mode = "n";
        key = "gd";
        action.__raw = "require('telescope.builtin').lsp_definitions";
        options = {
          desc = "LSP: [G]oto [D]efinition";
        };
      }
      {
        mode = "n";
        key = "gr";
        action.__raw = "require('telescope.builtin').lsp_references";
        options = {
          desc = "LSP: [G]oto [R]eferences";
        };
      }
      {
        mode = "n";
        key = "gI";
        action.__raw = "require('telescope.builtin').lsp_implementations";
        options = {
          desc = "LSP: [G]oto [I]mplementation";
        };
      }
      {
        mode = "n";
        key = "<leader>D";
        action.__raw = "require('telescope.builtin').lsp_type_definitions";
        options = {
          desc = "LSP: Type [D]efinition";
        };
      }
      {
        mode = "n";
        key = "<leader>ds";
        action.__raw = "require('telescope.builtin').lsp_document_symbols";
        options = {
          desc = "LSP: [D]ocument [S]ymbols";
        };
      }
      {
        mode = "n";
        key = "<leader>ws";
        action.__raw = "require('telescope.builtin').lsp_dynamic_workspace_symbols";
        options = {
          desc = "LSP: [W]orkspace [S]ymbols";
        };
      }
      {
        mode = "n";
        key = "<leader>rn";
        action.__raw = "vim.lsp.buf.rename";
        options = {
          desc = "LSP: [R]e[n]ame";
        };
      }
      {
        mode = [
          "n"
          "x"
        ];
        key = "<leader>ca";
        action.__raw = "vim.lsp.buf.code_action";
        options = {
          desc = "LSP: [C]ode [A]ction";
        };
      }
      {
        mode = "n";
        key = "gD";
        action.__raw = "vim.lsp.buf.declaration";
        options = {
          desc = "LSP: [G]oto [D]eclaration";
        };
      }
      {
        mode = [
          "n"
          "x"
        ];
        key = "<leader>ca";
        action.__raw = "vim.lsp.buf.code_action";
        options = {
          desc = "LSP: [C]ode [A]ction";
        };
      }
    ];
  };

  home.packages = with pkgs; [
    cargo
    rustc
    bun
    nodejs_22
    nixd
    nixfmt
    vscode-langservers-extracted
    tailwindcss-language-server
    typescript-language-server
    eslint
    rust-analyzer
    rustfmt
    jdt-language-server
    lombok
    fsautocomplete
    fantomas
  ];
}
