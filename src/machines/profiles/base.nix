{
  pkgs,
  defaultUser,
  ...
}: {
  environment.systemPackages = with pkgs; [wget zip zsh];

  # Make zsh default shell
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # Set timezone to PST
  time.timeZone = "America/Los_Angeles";

  users.users.${defaultUser} = {
    isNormalUser = true;
    extraGroups = ["wheel"];
  };

  # No sudo password
  security.sudo.wheelNeedsPassword = false;

  # Hosts file entries
  networking.extraHosts = ''
    127.0.0.1 catalyst-k8s-dev.cfyitz6hhoco.eu-central-1.rds.amazonaws.com
  '';
}
