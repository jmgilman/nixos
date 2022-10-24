{ inputs
, cell
}:
let
  inherit (inputs.cells.machines.lib) mkHM;
in
{
  git = (mkHM (import ./git.nix));
}
