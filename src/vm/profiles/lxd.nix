{defaultUser, ...}: {
  virtualisation.lxd = {
    enable = true;
    zfsSupport = true;
    recommendedSysctlSettings = true;
  };
  users.groups.lxd.members = [defaultUser];
}
