{ pkgs, ... }:

{
  # https://devenv.sh/packages/
  packages = [
    pkgs.bazelisk
    pkgs.buildifier
    pkgs.buildozer
    pkgs.gcc
    pkgs.nodejs.pkgs.pnpm
    pkgs.bazel-watcher
  ];

  # https://devenv.sh/scripts/

  enterShell = ''
    echo node `node --version`
    echo pnpm `pnpm --version`
    echo npm `npm --version`
    echo yarn `yarn --version`

    alias bazel='bazelisk'
  '';

  # https://devenv.sh/languages/
  languages.javascript.enable = true;
  languages.typescript.enable = true;
  languages.javascript.corepack.enable = true;

  # https://devenv.sh/pre-commit-hooks/
  # pre-commit.hooks.shellcheck.enable = true;

  # https://devenv.sh/processes/
  # processes.ping.exec = "ping example.com";

  # See full reference at https://devenv.sh/reference/options/
}
