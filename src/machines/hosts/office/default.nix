{ lib, pkgs, config, modulesPath, inputs, ... }:

with lib;
{
  imports = [
    "${modulesPath}/profiles/minimal.nix"
    inputs.vscode-server.nixosModule
  ];

  users.users.nixos.openssh.authorizedKeys = {
    keyFiles = [ ../../sshkey ];
  };
  services.openssh = {
    enable = true;
    ports = [ 22 ];
    extraConfig = "StreamLocalBindUnlink yes";
  };
  services.vscode-server.enable = true;
  environment.systemPackages = with pkgs; [ wget git zip nixpkgs-fmt gnupg ];

  programs.gnupg.agent = { enable = true; };
}
