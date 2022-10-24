{
  inputs.nixos.url = "nixpkgs/nixos-22.05";
  inputs.nixpkgs.follows = "nixos";

  inputs.nix.url = "nix/2.11-maintenance";

  inputs.nixos-wsl.url = "github:nix-community/nixos-wsl";
  inputs.nixos-wsl.inputs.nixpkgs.follows = "nixos";

  inputs.home-manager.url = "github:nix-community/home-manager/release-22.05";
  inputs.home-manager.inputs.nixpkgs.follows = "nixos";

  inputs.vscode-server.url = "github:msteen/nixos-vscode-server";
  inputs.vscode-server.inputs.nixpkgs.follows = "nixos";

  inputs.std.url = "github:divnix/std";
  inputs.std.inputs.nixpkgs.follows = "nixos";

  outputs = inputs @ { self, std, ... }:
    std.growOn
      {
        inherit inputs;
        cellsFrom = ./src;
        cellBlocks = [
          (std.data "hosts")
          (std.data "profiles")
          (std.functions "lib")
        ];
      }
      (
        let
          system = builtins.currentSystem or "x86_64-linux";
        in
        {
          nixosConfigurations = (std.harvest self [ "machines" "hosts" ]).${system};
        }
      );
}
