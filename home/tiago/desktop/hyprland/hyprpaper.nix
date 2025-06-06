{ ... }:

{
  # home.packages = with pkgs; [ hyprpaper ];
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "~/Pictures/wallpapers/amber.webp" ];
      wallpaper = [ ", ~/Pictures/wallpapers/amber.webp" ];
    };
  };

}
