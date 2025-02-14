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

    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = inputs@{ nixpkgs, home-manager, nixvim, catppuccin, ... }: {
    nixosConfigurations = {
      # TODO please change the hostname to your own
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; }; # needed by hyprland
        modules = [
          ./configuration.nix
          catppuccin.nixosModules.catppuccin

          # make home-manager as a module of nixos
          # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.tiago = {
              imports = [
                ./home/tiago/home.nix
                catppuccin.homeManagerModules.catppuccin
                nixvim.homeManagerModules.nixvim
              ];
            };
          }
        ];
      };
    };
  };
}
