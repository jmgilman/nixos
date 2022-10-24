{ inputs, ... }:
{
  imports = [
    inputs.vscode-server.nixosModule
  ];

  services.vscode-server.enable = true;
}
