{
  # pkgs,
  inputs,
  theLib,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/defaults.nix
    ../../modules/nixos/system/plymouth.nix
    ../../modules/nixos/locales.nix
    ../../modules/nixos/system/networkmanager.nix
    ../../modules/nixos/system/virtualization.nix
    ../../modules/nixos/services/flatpak.nix
    ../../modules/nixos/services/openssh-server.nix
    ../../modules/nixos/services/chromecast.nix
    ../../modules/nixos/system/desktops/xfce.nix
    ../../modules/nixos/system/autologin.nix
    ../../modules/nixos/system/systemd_boot.nix
    inputs.home-manager.nixosModules.home-manager
  ];
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;

  # COSMIC

  networking.hostName = "hypervisor";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.hypervisor = {
    isNormalUser = true;
    description = "GMU Hack Lab";
    extraGroups = [
      "sys"
      "ftp"
      "log"
      "games"
      "network"
      "networkmanager"
      "adm"
      "wheel"
      "input"
      "kvm"
      "lp"
      "optical"
      "disk"
      "audio"
      "uucp"
      "video"
      "systemd-journal"
      "rfkill"
      "libvirt"
      "libvirtd"
      "libvirt-qemu"
      "qemu"
      "docker"
      "tss"
      "vboxusers"
    ];
  };
  home-manager = {
    extraSpecialArgs = {inherit inputs theLib;};
    users = {
      hypervisor = import ./home.nix;
    };
  };

  # environment.systemPackages = with pkgs; [
  # ];

  services.xserver.dpi = 96;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [];
  networking.firewall.allowedUDPPorts = [];
  # Or disable firewall.
  #networking.firewall.enable = false;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  system.stateVersion = "23.11"; # DO NOT CHANGE
}
