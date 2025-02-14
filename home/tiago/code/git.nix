{ ... }:

let private = import ./private.nix;
in {
  programs.git = {
    enable = true;
    userName = private.git-name;
    userEmail = private.git-email;
  };
}
