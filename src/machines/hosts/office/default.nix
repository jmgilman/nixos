{ pkgs, modulesPath, inputs, ... }:
{
  imports = [
    "${modulesPath}/profiles/minimal.nix"
    inputs.vscode-server.nixosModule
  ];

  services.vscode-server.enable = true;
  environment.systemPackages = with pkgs; [ wget git zip nixpkgs-fmt ];
}
