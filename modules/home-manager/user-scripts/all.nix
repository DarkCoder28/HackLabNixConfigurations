{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./rebuild.nix
    ./update-system.nix
    ./icat.nix
    ./shred_history.nix
  ];
}
