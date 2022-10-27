{
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "github" = {
        hostname = "github.com";
        user = "jmgilman";
        identityFile = "~/.ssh/id_ed25519_sk";
      };
      "work" = {
        hostname = "office.gilman.io";
        user = "josh";
        identityFile = "~/.ssh/id_ed25519_sk";
      };
      "work-ext" = {
        hostname = "work";
        user = "josh";
        identityFile = "~/.ssh/id_ed25519_sk";
      };
    };
  };
}
