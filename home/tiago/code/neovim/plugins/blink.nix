{ ... }:

{
  programs.nixvim = {
    plugins.blink-cmp = {
      enable = true;
      settings = {
        signature = {
          enabled = true;
          window = { border = "rounded"; };
        };

        completion = {
          menu = { border = "rounded"; };
          documentation = {
            auto_show = true;
            auto_show_delay_ms = 500;
            window = { border = "rounded"; };
          };
        };

        appearance = {
          use_nvim_cmp_as_default = false;
          nerd_font_variant = "mono";
          kind_icons = {
            Text = "󰉿";
            Method = "";
            Function = "󰊕";
            Constructor = "󰒓";

            Field = "󰜢";
            Variable = "󰆦";
            Property = "󰖷";

            Class = "󱡠";
            Interface = "󱡠";
            Struct = "󱡠";
            Module = "󰅩";

            Unit = "󰪚";
            Value = "󰦨";
            Enum = "󰦨";
            EnumMember = "󰦨";

            Keyword = "󰻾";
            Constant = "󰏿";

            Snippet = "󱄽";
            Color = "󰏘";
            File = "󰈔";
            Reference = "󰬲";
            Folder = "󰉋";
            Event = "󱐋";
            Operator = "󰪚";
            TypeParameter = "󰬛";
            Error = "󰏭";
            Warning = "󰏯";
            Information = "󰏮";
            Hint = "󰏭";

            Emoji = "🤶";
          };
        };

        sources = {
          default = [ "copilot" "lsp" "path" "snippets" "buffer" "dadbod" ];
          providers = {
            # copilot = {
            #   name = "copilot";
            #   module = "blink-cmp-copilot";
            # };
            copilot = {
              name = "copilot";
              module = "blink-cmp-copilot";
              score_offset = 100;
              async = true;
            };
            dadbod = {
              name = "Dadbod";
              module = "vim_dadbod_completion.blink";
            };
          };
        };
      };
    };
    plugins.blink-cmp-copilot = { enable = true; };
    # plugins.lsp.capabilities = ''
    #   capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)
    # '';
    plugins.lsp.capabilities = # Lua
      ''
        capabilities = vim.tbl_deep_extend('force', capabilities, require('blink.cmp').get_lsp_capabilities())
      '';
  };
}
