{ inputs
, cell
}:
let
  inherit (inputs) nixpkgs;
in
{
  gh-dash = nixpkgs.callPackage ./gh-dash.nix { };
}
