{ inputs
, cell
,
}:
let
  inherit (inputs) nixos;
in
{
  Office = cell.lib.mkSystem {
    system = "x86_64-linux";
    profiles = [
      cell.profiles.wsl
      ./office
    ];
  };
}
