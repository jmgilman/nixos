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
      cell.hm.base
      cell.profiles.base
      cell.profiles.wsl
      cell.profiles.vscode-server
      dev.hm.git
      dev.profiles.git
      security.hm.gpg
      security.profiles.gpg
      security.profiles.ssh
      ./office
    ];
  };
}
