{
  config,
  home,
  pkgs,
  ...
}: let
  update-system = pkgs.writeShellScriptBin "update-system" ''
    set -e
    pushd $HOME/.nixos/
    echo "NixOS Updating..."
    sudo nix flake update
    git add ./flake.lock
    popd
    # sudo rebuild
    ${pkgs.libnotify}/bin/notify-send -e "NixOS Update OK!" --icon=software-update-available
  '';
in {
  home.packages = [update-system];
}
