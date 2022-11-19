{ defaultUser, ... }:
{
  services.openssh = {
    enable = true;
    permitRootLogin = "no";
    passwordAuthentication = false;
    kbdInteractiveAuthentication = false;
    extraConfig = ''
      StreamLocalBindUnlink yes
      GatewayPorts yes
    '';
  };

  programs.ssh.startAgent = true;

  users.users.${defaultUser}.openssh.authorizedKeys = {
    keyFiles = [
      ../files/mac_sshkey
      ../files/office_sshkey
    ];
  };
}
