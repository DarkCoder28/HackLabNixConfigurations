{
  config,
  home,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    kitty
    kitty-img
  ];
  programs.kitty = {
    enable = true;
    font.name = "JetBrainsMono Nerd Font";
    settings = {
      enable_audio_bell = false;
      window_alert_on_bell = false;
      confirm_os_window_close = 0;
      linux_display_server = "auto";
      wayland_enable_ime = true;
    };
    shellIntegration.enableBashIntegration = true;
  };
}
