{
  services.openssh = {
    enable = true;
    ports = [ 22 ];
    extraConfig = "StreamLocalBindUnlink yes";
  };

  programs.ssh.startAgent = true;

  users.users.nixos.openssh.authorizedKeys = {
    keyFiles = [ ../files/sshkey ];
  };
}
