# { pkgs, ... }:
# let
#   # use nix shell nixpkgs\#nurl -c nurl https://github.com/rafaelmardojai/firefox-gnome-theme
#   ff_gnome_theme = pkgs.fetchFromGitHub {
#     owner = "rafaelmardojai";
#     repo = "firefox-gnome-theme";
#     rev = "aca2034bffd17b4faee9539b38bce98b9e564da9";
#     hash = "sha256-EgxCwCKhInik1RQ6ePwy8GVpCUHvbBSCtvOoQ4Bs4TI=";
#   };
# in {
#   home-manager.useGlobalPkgs = true;
#   home-manager.useUserPackages = true;
#   home-manager.backupFileExtension = "backup";
#   programs.firefox = {
#     enable = true;
#     profiles.tiago = {
#       userChrome = builtins.readFile (ff_gnome_theme + "/userChrome.css");
#       userContent = builtins.readFile (ff_gnome_theme + "/userContent.css");
#       extraConfig =
#         builtins.readFile (ff_gnome_theme + "/configuration/user.js");
#     };
#   };
# }
