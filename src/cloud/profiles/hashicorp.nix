{ pkgs, ... }:
{
  environment.systemPackages = with pkgs;
    [
      consul
      nomad
      packer
      terraform
      vault
    ];
}
