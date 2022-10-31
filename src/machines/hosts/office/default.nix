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

  networking.useDHCP = false;
  networking.bridges = {
    "br0" = {
      interfaces = [ "ens33" ];
    };
  };
  networking.interfaces.br0.ipv4.addresses = [{
    address = "192.168.0.96";
    prefixLength = 24;
  }];
  networking.defaultGateway = "192.168.0.1";
  networking.nameservers = [ "1.1.1.1" "8.8.8.8" ];
}
