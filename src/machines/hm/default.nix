{ inputs
, cell
}:
let
  inherit (inputs.cells.machines.lib) mkHM;
in
{
  base = (mkHM (import ./base.nix));
}
