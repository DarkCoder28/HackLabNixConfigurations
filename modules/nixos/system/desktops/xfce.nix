{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./../polkit_gnome.nix
    ./../x11.nix
  ];
  environment.systemPackages = with pkgs; [
    xfce.mousepad
    xfce.parole
    xfce.ristretto
    xfce.xfburn
    xfce.xfce4-battery-plugin
    xfce.xfce4-cpufreq-plugin
    xfce.xfce4-cpugraph-plugin
    xfce.xfce4-dict
    xfce.xfce4-eyes-plugin
    xfce.xfce4-fsguard-plugin
    xfce.xfce4-genmon-plugin
    xfce.xfce4-mailwatch-plugin
    xfce.xfce4-mpc-plugin
    xfce.xfce4-netload-plugin
    xfce.xfce4-notes-plugin
    xfce.xfce4-notifyd
    xfce.xfce4-pulseaudio-plugin
    xfce.xfce4-screensaver
    xfce.xfce4-screenshooter
    xfce.xfce4-sensors-plugin
    xfce.xfce4-systemload-plugin
    xfce.xfce4-taskmanager
    xfce.xfce4-time-out-plugin
    xfce.xfce4-timer-plugin
    xfce.xfce4-verve-plugin
    xfce.xfce4-weather-plugin
    xfce.xfce4-whiskermenu-plugin
    xfce.xfce4-xkb-plugin
    xkeyboard_config
    xdg-desktop-portal-gtk
  ];
  xdg.portal.extraPortals = with pkgs; [xdg-desktop-portal-gtk];
  services.displayManager.defaultSession = "xfce";
  services.xserver = {
    desktopManager = {
      xterm.enable = false;
      xfce.enable = true;
    };
  };
}
