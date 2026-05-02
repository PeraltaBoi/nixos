{ config, ... }:

{
  # home.packages = with pkgs; [ hyprpaper ];
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ config.systemTheme.settings.wallpaperPath ];
      wallpaper = [ (", " + config.systemTheme.settings.wallpaperPath) ];
      # preload = [ "~/Pictures/wallpapers/amber.webp" ];
      # wallpaper = [ ", ~/Pictures/wallpapers/amber.webp" ];
    };
  };

}
