{ pkgs, ... }:
let
  # Read all files in the current directory and the 'plugins' directory
  files = builtins.readDir ./.;
  pluginFiles = builtins.readDir ./plugins;

  # Filter out default.nix and non-.nix files from both directories
  nixFiles = builtins.filter
    (name: name != "default.nix" && builtins.match ".*\\.nix" name != null)
    (builtins.attrNames files ++ builtins.attrNames pluginFiles);

  # Create a list of import statements for both directories
  imports = map (name:
    if builtins.elem name (builtins.attrNames files) then
      ./. + "/${name}"
    else
      ./plugins + "/${name}") nixFiles;
in {
  programs.nixvim = { enable = true; };
  # Import all configuration modules automatically
  inherit imports;

  home.packages = with pkgs; [ nixd nixfmt ];
}
