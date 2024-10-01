{
  home,
  pkgs,
  ...
}: let
  icat = pkgs.writeShellScriptBin "icat" ''
    if (( $# == 0 )); then
      echo "Error: No image provided"
    else
      ${pkgs.kitty}/bin/kitty +kitten icat $1
    fi
  '';
in {
  home.packages = [icat];
}
