{ pkgs, ... }:

{
  programs.nixvim = {
    extraPlugins = [ pkgs.vimPlugins.Ionide-vim ];
  };

  home.packages = with pkgs; [
    fsautocomplete
    fantomas
  ];
}
