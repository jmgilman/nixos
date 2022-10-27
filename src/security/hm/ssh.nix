{
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "github" = {
        hostname = "github.com";
        user = "jmgilman";
        identityFile = "~/.ssh/id_ed25519_sk";
      };
    };
  };
}
