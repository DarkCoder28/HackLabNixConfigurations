{
  config,
  home,
  pkgs,
  ...
}: {
  home.file."~/.config/libvirt/qemu.conf".text = ''
    # Adapted from /var/lib/libvirt/qemu.conf
    # Note that AAVMF and OVMF are for Aarch64 and x86 respectively
    nvram = [ "/run/libvirt/nix-ovmf/AAVMF_CODE.fd:/run/libvirt/nix-ovmf/AAVMF_VARS.fd", "/run/libvirt/nix-ovmf/OVMF_CODE.fd:/run/libvirt/nix-ovmf/OVMF_VARS.fd" ]
  '';

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };
}
