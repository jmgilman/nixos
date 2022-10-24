{ inputs, defaultUser, ... }:
{
  imports = [
    inputs.nixos-wsl.nixosModules.wsl
  ];

  wsl = {
    inherit defaultUser;
    enable = true;
    automountPath = "/mnt";
    startMenuLaunchers = true;
  };
}
