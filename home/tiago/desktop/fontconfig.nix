{ ... }:

{
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      sansSerif = [ "Adwaita Sans" ];
      serif = [ "Inter" ];
      monospace = [ "Adwaita Mono" ];
      # emoji = [ "Noto Color Emoji" ];
    };

    # antialias = true;
    # hinting = {
    #   enable = true;
    #   stryle = "slight";
    # };
  };
}
