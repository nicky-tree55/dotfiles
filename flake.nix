{
  description = "nt's macOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-claude-code.url = "github:ryoppippi/nix-claude-code";
  };

  outputs = { self, nixpkgs, nix-darwin, home-manager, nix-claude-code }:
  let
    username = "nt";
    homeDirectory = "/Users/${username}";
    gitName = "nicky-tree55";
    gitEmail = "68451176+nicky-tree55@users.noreply.github.com";
  in {
    darwinConfigurations."personal" = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        ./darwin.nix
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";
          home-manager.extraSpecialArgs = {
            inherit username homeDirectory gitName gitEmail nix-claude-code;
          };
          home-manager.users.${username} = import ./home.nix;
        }
      ];
    };
  };
}
