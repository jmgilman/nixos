{
  programs.ssh = {
    matchBlocks = {
      "cert" = {
        hostname = "192.168.0.123";
        user = "josh";
        identityFile = "~/.ssh/id_ed25519";
      };
      "core01" = {
        hostname = "192.168.0.120";
        user = "josh";
        identityFile = "~/.ssh/id_ed25519";
      };
      "core02" = {
        hostname = "192.168.0.121";
        user = "josh";
        identityFile = "~/.ssh/id_ed25519";
      };
      "core03" = {
        hostname = "192.168.0.122";
        user = "josh";
        identityFile = "~/.ssh/id_ed25519";
      };
    };
  };
}
