{ inputs
, cell
}:
let
  inherit (inputs.cells.machines.lib) mkHM;
in
{
  gpg = (mkHM (import ./gpg.nix));
  ssh = (mkHM (import ./ssh.nix));
}
