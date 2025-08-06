{ pkgs, ... }:

{
  home.packages = with pkgs; [ ];

  gtk = {
    enable = true;

    iconTheme = {
      package = pkgs.morewaita-icon-theme;
      name = "MoreWaita";
    };
  };

  catppuccin = {
    # enable = true;
    # gtk.enable = true;
    nushell.enable = true;
    helix.enable = false;
    flavor = "mocha";
  };
}
