{ pkgs, ... }:

{

  # https://devenv.sh/packages/
  packages = [
    pkgs.bazelisk
    pkgs.buildifier
    pkgs.buildozer
    pkgs.gcc
  ];

  # https://devenv.sh/languages/
  # languages.java.enable = true;
}