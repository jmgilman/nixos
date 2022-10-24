{ inputs
, cell
}:
let
  inherit (inputs) nixos;
  inherit (inputs.cells) nix;
in
{
  mkSystem =
    { system ? nixos.legacyPackages.system
    , profiles ? [ ]
    }:
    inputs.nixos.lib.nixosSystem {
      inherit system;
      modules =
        [
          nix.profiles.default
        ]
        ++ profiles;
      specialArgs = {
        inherit inputs;
      };
    };
}
