{ inputs
, cell
}:
let
  inherit (inputs.cells.machines.lib) mkHM;
  inherit (inputs) nixpkgs;
in
{
  git = (mkHM (import ./git.nix { inherit inputs nixpkgs; }));
}
