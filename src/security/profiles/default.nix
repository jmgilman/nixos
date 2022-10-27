{ inputs
, cell
}:
{
  gpg = import ./gpg.nix;
  ssh = import ./ssh.nix;
  tailscale = import ./tailscale.nix;
}
