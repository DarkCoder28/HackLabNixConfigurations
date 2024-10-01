{
  config,
  home,
  pkgs,
  ...
}: {
  users.users.${home.username}.extraGroups = ["libvirtd"];
  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };
}
