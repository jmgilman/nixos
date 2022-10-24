{ inputs
, cell
,
}:
let
  inherit (inputs) nixos;
  inherit (inputs.cells) dev security;
in
{
  Office = cell.lib.mkSystem {
    system = "x86_64-linux";
    profiles = [
      cell.profiles.base
      cell.profiles.wsl
      cell.profiles.vscode-server
      dev.profiles.git
      security.hm.gpg
      security.profiles.gpg
      security.profiles.ssh
      ./office
    ];
  };
}
