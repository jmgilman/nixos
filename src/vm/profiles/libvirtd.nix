{
  config,
  pkgs,
  defaultUser,
  ...
}: {
  virtualisation.libvirtd = {
    enable = true;
    onBoot = "ignore";
    onShutdown = "shutdown";
    qemu = {
      package = pkgs.qemu_kvm;
    };
  };

  environment.systemPackages = with pkgs; [virtmanager];

  users.groups.libvirtd.members = [defaultUser];
  users.groups.kvm.members = [defaultUser];

  # Required by LXD to talk to QEMU guests
  boot.kernelModules = ["vhost_vsock"];

  # Required by libvirtd
  security.polkit.enable = true;
}
