{ ... }:

{
  programs.nixvim = {
    clipboard.register = "unnamedplus";

    extraConfigLua = ''
      -- set filetype plugin indent on with lua
      vim.cmd [[filetype plugin indent on]]
      vim.cmd [[set autoindent]]
    '';

    diagnostics = { virtual_text = true; };

    opts = {
      mouse = "a";
      tabstop = 2;
      number = true;
      relativenumber = true;
      showmode = false;
      breakindent = true;
      undofile = true;
      ignorecase = true;
      smartcase = true;
      signcolumn = "yes";
      updatetime = 250;
      timeoutlen = 300;
      splitright = true;
      splitbelow = true;
      list = true;
      listchars = {
        tab = "» ";
        trail = "·";
        nbsp = "␣";
      };
      inccommand = "split";
      cursorline = true;
      scrolloff = 5;
      laststatus = 3;
      whichwrap = "b,s,<,>,[,],h,l";
      # filetype = {
      #   plugin = true;
      #   indent = true;
      # };
      autoindent = true;
      conceallevel = 2;
    };

  };
}
