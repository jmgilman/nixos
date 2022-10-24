{ defaultUser, ... }:
{
  services.openssh = {
    enable = true;
    ports = [ 22 ];
    extraConfig = "StreamLocalBindUnlink yes";
  };

  programs.ssh.startAgent = true;

  users.users.${defaultUser}.openssh.authorizedKeys = {
    keyFiles = [ ../files/sshkey ];
  };
}
