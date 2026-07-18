{ ... }:

{
  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        name = "PeraltaBoi";
        email = "tiagofilipeperalta@gmail.com";
      };
      ui = {
        diff-formatter = [
          "difft"
          "--color=always"
          "$left"
          "$right"
        ];
        default-command = [
          "log"
          "--reversed"
        ];
      };
    };
  };
}
