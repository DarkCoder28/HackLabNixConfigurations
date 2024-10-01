{
  config,
  home,
  pkgs,
  ...
}: {
  imports = [
    ../config/fastfetch.nix
    ../config/bashrc.nix
  ];
  home.packages = with pkgs; [
    pv
    btop
    calc
    gnome-keyring
    gnupg
    gparted
    hex
    fastfetch
    oh-my-posh
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    xfce.thunar-media-tags-plugin
    unrar
    unzip
    wget
    xarchiver
    xsensors
  ];
}
