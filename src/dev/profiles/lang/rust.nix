{ inputs, pkgs, ... }:
{
  nixpkgs.overlays = [ inputs.rust-overlay.overlays.default ];
  environment.systemPackages = with pkgs;
    [
      cargo-edit
      rust-bin.stable.latest.default
    ];
}
