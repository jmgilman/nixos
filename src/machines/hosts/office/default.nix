{ modulesPath, ... }:
{
  imports = [
    "${modulesPath}/profiles/minimal.nix"
    ./hardware-configuration.nix
  ];

  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda";
  environment.noXlibs = false;
}
