{ pkgs, ... }:

{
  # https://devenv.sh/packages/
  packages = [
    pkgs.bazelisk
    pkgs.buildifier
    pkgs.buildozer
    pkgs.gcc
    pkgs.nix
  ];
}
