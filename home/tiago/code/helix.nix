{ ... }:

{
  programs.helix = {
    enable = true;
    settings = {
      editor = {
        mouse = true;
        line-number = "relative";
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
    };
    languages = {
      language = [
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
    };
  };
}

