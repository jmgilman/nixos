{ inputs
, cell
}:
{
  docker = import ./docker.nix;
  lxd = import ./lxd.nix;
}
