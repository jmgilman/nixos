{ inputs
, cell
,
}:
let
  inherit (inputs) nixos;
  inherit (inputs.cells) security;
in
{
  Office = cell.lib.mkSystem {
    system = "x86_64-linux";
    profiles = [
      cell.profiles.wsl
      cell.profiles.vscode-server
      security.profiles.gpg
      security.profiles.ssh
      ./office
    ];
  };
}
