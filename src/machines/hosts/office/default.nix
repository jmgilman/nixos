{ pkgs, modulesPath, inputs, ... }:
{
  imports = [
    "${modulesPath}/profiles/minimal.nix"
  ];

  environment.systemPackages = with pkgs; [ wget git zip nixpkgs-fmt ];
}
