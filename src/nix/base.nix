{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  system.stateVersion = "22.11";

  environment.systemPackages = with pkgs; [
    cachix
    nixpkgs-fmt
    nixos-generators
  ];

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  nix = {
    package = inputs.nix.packages.nix;

    gc.automatic = true;
    gc.dates = "weekly";
    optimise.automatic = true;

    settings = {
      auto-optimise-store = true;
      allowed-users = ["@wheel"];
      trusted-users = ["root" "@wheel"];
      experimental-features = [
        "flakes"
        "nix-command"
        "repl-flake"
      ];
      accept-flake-config = true;
    };

    extraOptions = ''
      keep-outputs = true
      keep-derivations = true
    '';
  };
}
