{ ... }:

{
  # home.packages = with pkgs; [ hyprpaper ];
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "~/Pictures/wallpapers/abstract.png" ];
      wallpaper = [ ", ~/Pictures/wallpapers/abstract.png" ];
    };
  };

}
