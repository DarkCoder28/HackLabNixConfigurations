{
  home,
  pkgs,
  ...
}: let
  shred_history = pkgs.writeShellScriptBin "shred_history" ''
    shred ~/.bash_history
    rm ~/.bash_history
  '';
in {
  home.packages = [shred_history];
}
