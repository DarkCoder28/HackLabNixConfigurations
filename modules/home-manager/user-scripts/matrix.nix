{
  config,
  home,
  pkgs,
  ...
}: let
  matrix = pkgs.writeShellScriptBin "matrix" ''
    ${pkgs.kitty}/bin/kitty --start-as fullscreen ${pkgs.bash}/bin/sh -c "sleep 5 && ${pkgs.cmatrix}/bin/cmatrix -absLu 1" &
  '';
in {
  home.packages = [matrix];
}
