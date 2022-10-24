{ inputs
, cell
}:
{
  base = import ./base.nix;
  vscode-server = import ./vscode-server.nix;
  wsl = import ./wsl.nix;
}
