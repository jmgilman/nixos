{
  inputs,
  cell,
}: {
  docker = import ./docker.nix;
  libvirtd = import ./libvirtd.nix;
  lxd = import ./lxd.nix;
}
