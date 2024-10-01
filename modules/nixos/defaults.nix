{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./fonts.nix
    ./services/keyring.nix
    ./services/udisks.nix
    ./tpm.nix
  ];
  environment.systemPackages = with pkgs; [
    firefox
    vim
    wget
    git
    file
    doas
    screen
    wireguard-tools
    wirelesstools
    lshw
    libsecret
    ntfs3g
    ntfsprogs

    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    xfce.thunar-media-tags-plugin
    xfce.catfish
    udisks
    gvfs
    udiskie
  ];
  programs.appimage = {
    enable = true;
    binfmt = true;
  };
  environment.sessionVariables = {
    MOZ_USE_XINPUT2 = "1";
  };
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
}
