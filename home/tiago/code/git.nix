{ ... }:

{
  programs.git = {
    enable = true;
    userName = "PeraltaBoi";
    userEmail = "tiagofilipeperalta@gmail.com";
    extraConfig = { push = { autoSetupRemote = true; }; };
  };
}
