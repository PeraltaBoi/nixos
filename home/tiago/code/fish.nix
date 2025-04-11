{ pkgs, specialArgs, ... }:

let
  inherit (specialArgs) theme;

  rose-pine-fish = pkgs.fetchFromGitHub {
    owner = "rose-pine";
    repo = "fish";
    rev = "38aab5baabefea1bc7e560ba3fbdb53cb91a6186";
    hash = "sha256-bSGGksL/jBNqVV0cHZ8eJ03/8j3HfD9HXpDa8G/Cmi8=";
  };

  kanagawa-fish = pkgs.fetchFromGitHub {
    owner = "rebelot";
    repo = "kanagawa.nvim";
    rev = "2de175482f215c69a1d12ab10a8bf2a7a2e44ff2";
    hash = "sha256-5ee5TqTcCA+2F0zrshhbDvrrTkZ0dQYzhqq+t5KnTpI=";
  };

  catppuccin-fish = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "fish";
    rev = "cc8e4d8fffbdaab07b3979131030b234596f18da";
    hash = "sha256-udiU2TOh0lYL7K7ylbt+BGlSDgCjMpy75vQ98C1kFcc=";
  };

  themeMapping = {
    "rose-pine" = {
      source = "${rose-pine-fish}/themes/Rosé Pine Dawn.theme";
      name = "Rosé Pine Dawn";
      isScript = false;
    };
    "kanagawa" = {
      source = "${kanagawa-fish}/extras/fish/kanagawa.fish";
      name = "kanagawa";
      isScript = true;
    };
    "catppuccin" = {
      source = "${catppuccin-fish}/themes/Catppuccin Mocha.theme";
      name = "Catppuccin Mocha";
      isScript = false;
    };
  };

  selectedTheme = themeMapping.${theme} or themeMapping.rose-pine;
in {
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
              ${
                if selectedTheme.isScript then
                  "source ${selectedTheme.source}"
                else if theme != "catppuccin" then
                  ''fish_config theme choose "${selectedTheme.name}"''
                else
                  ""
              }
      	    nitch
    '';
    plugins = [{
      name = "grc";
      src = pkgs.fishPlugins.grc.src;
    }];
  };
  home.packages = with pkgs; [ grc eza zoxide ];

  xdg.configFile = if theme != "catppuccin" && !selectedTheme.isScript then {
    "fish/themes/${selectedTheme.name}.theme".source = selectedTheme.source;
  } else
    { };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
    options = [ "--cmd cd" ];
  };
}
