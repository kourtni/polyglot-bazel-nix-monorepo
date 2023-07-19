{ pkgs, ... }:

{

  # https://devenv.sh/packages/
  packages = [
    pkgs.bazelisk
    pkgs.buildifier
    pkgs.buildozer
    pkgs.gcc
  ];

  enterShell = ''
    java --version
  '';

  # https://devenv.sh/languages/
  languages.java.enable = true;
  languages.java.jdk.package = pkgs.jdk17;
}