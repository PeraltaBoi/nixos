{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = { };
  };
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
            set fish_greeting # Disable greeting
            alias ls='eza'
            alias grep='grep --color=auto'
      			nitch
    '';
    plugins = [{
      name = "grc";
      src = pkgs.fishPlugins.grc.src;
    }];
  };
  home.packages = with pkgs; [ grc eza zoxide ];

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
    options = [ "--cmd cd" ];
  };
}
