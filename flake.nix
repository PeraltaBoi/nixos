{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # home-manager, used for managing user configuration
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin.url = "github:catppuccin/nix";

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, nixvim, nvf, catppuccin, zen-browser, ... }: {
      nixosConfigurations = {
        # TODO please change the hostname to your own
        nixos = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          # extraSpecialArgs = { theme = "rose-pine"; };
          modules = [
            ./configuration.nix
            catppuccin.nixosModules.catppuccin

            # make home-manager as a module of nixos
            # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {
                theme = "catppuccin";
                transparent = false;
              };

              home-manager.users.tiago = {
                imports = [
                  ./home/tiago/home.nix
                  catppuccin.homeManagerModules.catppuccin
                  nixvim.homeManagerModules.nixvim
                  nvf.homeManagerModules.default
                  zen-browser.homeModules.twilight
                ];
              };
            }
          ];
        };
      };
    };
}
