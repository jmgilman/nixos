{
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "github" = {
        hostname = "github.com";
        user = "jmgilman";
        identityFile = "~/.ssh/id_ed25519_sk";
      };
      "office" = {
        hostname = "office.gilman.io";
        user = "joshu";
        identityFile = "~/.ssh/id_ed25519_sk";
      };
      "work" = {
        hostname = "work.gilman.io";
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
