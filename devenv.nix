{ pkgs, ... }:

{
  # https://devenv.sh/basics/
  env.GREET = "Polyglot Bazel-Nix Monorepo";

  # https://devenv.sh/packages/
  packages = [
    pkgs.bazel
    pkgs.buildifier
    pkgs.buildozer
    pkgs.gcc
  ];

  # https://devenv.sh/scripts/

  enterShell = ''
    echo -e "\033[0;31m### Welcome to the $GREET. Remember to commit early & often! ###\033[0m"
    echo "This shell contains the following development tools:"
    git --version
    bazel --version
    buildozer --version
    nix --version
    devenv version
    gcc --version
  '';

  # https://devenv.sh/languages/
  # languages.nix.enable = true;

  # https://devenv.sh/pre-commit-hooks/
  # pre-commit.hooks.shellcheck.enable = true;

  # https://devenv.sh/processes/
  # processes.ping.exec = "ping example.com";

  # See full reference at https://devenv.sh/reference/options/
}
