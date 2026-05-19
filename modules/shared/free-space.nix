{
  config,
  inputs,
  pkgs,
  ...
}:
pkgs.writeShellApplication {
  name = "free-space";
  runtimeInputs = [
    config.nix.package
    inputs.fast-nix-gc.packages.${pkgs.stdenv.hostPlatform.system}.default
    pkgs.coreutils
    pkgs.gawk
  ];
  text = builtins.readFile ./free-space.bash;
}
