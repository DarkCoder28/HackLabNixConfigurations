{
  config,
  home,
  pkgs,
  ...
}: let
  rebuild = pkgs.writeShellScriptBin "rebuild" ''
    rm -Rf /home/hypervisor/.config/gtk*
    rm -f /home/hypervisor/.gtkrc-2.0
    if (( $# == 0 )); then
      FLAKEDIR=$HOME/.nixos/
    else
      FLAKEDIR=$1
    fi
    set -e
    pushd $FLAKEDIR
    if (( $# == 0 )); then
      git diff -U0 *
    fi
    echo "NixOS Rebuilding..."
    sudo nixos-rebuild switch --flake .#$HOSTNAME
    current=$(nixos-rebuild list-generations 2>&1 | grep current)
    git commit -am "$current"
    git push
    popd
    ${pkgs.libnotify}/bin/notify-send -e "NixOS Rebuild OK!" --icon=software-update-available
  '';
in {
  home.packages = [rebuild];
}
