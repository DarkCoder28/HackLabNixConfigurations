{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    libtpms
    qemu_kvm
    virtiofsd
    libtpms
    swtpm
    virtiofsd
    vagrant
  ];
  virtualisation.virtualbox = {
    host = {
      enable = true;
      enableKvm = true;
    };
    guest.enable = true;
  };
  # virtualisation.libvirtd = {
  #   enable = true;
  #   qemu.swtpm.enable = true;
  #   qemu.package = pkgs.qemu_kvm;
  #   # qemu.ovmf.packages = [pkgs.OVMFFull];
  # };
  # programs.virt-manager.enable = true;
}
