{ config, pkgs, ... }:

{
  imports = [ ./code ./desktop ];

  # catppuccin = {
  #   enable = true;
  #   gtk.enable = false;
  #   flavor = "mocha";
  # };
  # dconf.settings = {
  #   "org/gnome/desktop/interface" = { color-scheme = "prefer-dark"; };
  # };

  home.shell.enableShellIntegration = true;
  
  home.sessionVariables.NIXOS_OZONE_WL = "1";

  home.username = "tiago";
  home.homeDirectory = "/home/tiago";

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}

