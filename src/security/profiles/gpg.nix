{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ gnupg yubikey-manager ];
  
  services.pcscd.enable = true;
  programs.gnupg.agent = { 
    enable = true; 
    pinentryFlavor = "curses";
  };
}
