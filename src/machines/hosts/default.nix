{ inputs
, cell
,
}:
let
  inherit (inputs) nixos;
  inherit (inputs.cells) cloud dev security vm;
in
{
  Office = cell.lib.mkSystem {
    system = "x86_64-linux";
    profiles = [
      cell.hm.base
      cell.profiles.base
      cell.profiles.vscode-server
      cloud.profiles.base
      cloud.profiles.hashicorp
      dev.hm.git
      dev.profiles.git
      dev.profiles.lang.rust
      dev.profiles.lang.python
      dev.profiles.lang.shell
      security.hm.gpg
      security.hm.ssh
      security.profiles.gpg
      security.profiles.ssh
      security.profiles.tailscale
      vm.profiles.docker
      ./office
    ];
  };
}
