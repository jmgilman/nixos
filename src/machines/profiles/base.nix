{ pkgs, defaultUser, ... }:
{
  environment.systemPackages = with pkgs; [ wget zip ];

  users.users.${defaultUser} = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };
}
