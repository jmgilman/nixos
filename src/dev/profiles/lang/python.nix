{ pkgs, ... }:
{
  environment.systemPackages =
    let
      packages = pythonPackages:
        with pythonPackages; [
          numpy
          pandas
          requests
        ];

      python = pkgs.python3.withPackages packages;
    in
    [ python ];
}
