{ inputs
, cell
}:
{
  base = import ./base.nix;
  hashicorp = import ./hashicorp.nix;
}
