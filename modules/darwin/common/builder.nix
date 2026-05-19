{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:
{
  # use fast-nix-gc for gc and optimise
  nix.gc.automatic = false;
  nix.settings.auto-optimise-store = false;

  launchd.daemons.free-space = {
    serviceConfig = {
      StartCalendarInterval = [ { Minute = 15; } ];
    };
    command = lib.getExe (
      import "${inputs.self}/modules/shared/free-space.nix" { inherit config inputs pkgs; }
    );
  };

  # https://github.com/nix-darwin/nix-darwin/blob/230a197063de9287128e2c68a7a4b0cd7d0b50a7/modules/nix/default.nix#L201
  nix.daemonProcessType = "Interactive";
}
