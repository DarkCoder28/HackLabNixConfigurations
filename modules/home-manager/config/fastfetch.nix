{
  config,
  home,
  pkgs,
  ...
}: let
  neofetch-wrapper = pkgs.writeShellScriptBin "neofetch" ''
    ${pkgs.fastfetch}/bin/fastfetch
  '';
in {
  home.packages = [neofetch-wrapper];
  home.file.".config/fastfetch/config.jsonc".source = ./fastfetch/config.jsonc;
}
