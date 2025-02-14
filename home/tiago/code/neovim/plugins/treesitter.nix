{ pkgs, ... }:

{
  programs.nixvim = {
    plugins.treesitter = {
      enable = true;
      settings = {
        highlight.enable = true;
        indent.enable = true;
      };

      # grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      #   bash
      #   json
      #   c
      #   cpp
      #   c_sharp
      #   css
      #   go
      #   html
      #   javascript
      #   json
      #   lua
      #   make
      #   markdown
      #   nix
      #   prisma
      #   python
      #   regex
      #   rust
      #   toml
      #   tsx
      #   typescript
      #   vim
      #   vimdoc
      #   xml
      #   yaml
      #   zig
      # ];
    };
  };
}

