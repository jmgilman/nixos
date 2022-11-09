{
  # Nix inputs
  inputs.nixos.url = "nixpkgs/nixos-22.05";
  inputs.nixpkgs.follows = "nixos";

  inputs.nix.url = "nix/2.11-maintenance";

  inputs.nixos-wsl.url = "github:nix-community/nixos-wsl";
  inputs.nixos-wsl.inputs.nixpkgs.follows = "nixos";

  # Supporting inputs
  inputs.home-manager.url = "github:nix-community/home-manager/release-22.05";
  inputs.home-manager.inputs.nixpkgs.follows = "nixos";

  inputs.std.url = "github:divnix/std";
  inputs.std.inputs.nixpkgs.follows = "nixos";

  # User inputs
  inputs.rust-overlay.url = "github:oxalica/rust-overlay";
  inputs.rust-overlay.inputs.nixpkgs.follows = "nixos";

  inputs.tree-grepper.url = "github:brianhicks/tree-grepper";
  inputs.tree-grepper.inputs.nixpkgs.follows = "nixos";

  inputs.vscode-server.url = "github:msteen/nixos-vscode-server";
  inputs.vscode-server.inputs.nixpkgs.follows = "nixos";

  outputs = inputs @ {
    self,
    std,
    ...
  }:
    std.growOn
    {
      inherit inputs;
      cellsFrom = ./src;
      cellBlocks = [
        (std.data "hm")
        (std.data "hosts")
        (std.data "profiles")
        (std.functions "lib")
        (std.installables "packages")
      ];
    }
    (
      let
        system = builtins.currentSystem or "x86_64-linux";
      in {
        nixosConfigurations = (std.harvest self ["machines" "hosts"]).${system};
      }
    );
}
