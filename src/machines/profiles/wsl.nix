{ lib, pkgs, config, modulesPath, inputs, ... }:

with lib;
{
  imports = [
    inputs.nixos-wsl.nixosModules.wsl
  ];

  wsl = {
    enable = true;
    automountPath = "/mnt";
    defaultUser = "nixos";
    startMenuLaunchers = true;
  };
}
