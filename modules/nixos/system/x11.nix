{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    numlockx
  ];
  services = {
    libinput = {
      enable = true;
      mouse = {
        accelProfile = "flat";
      };
      touchpad = {
        naturalScrolling = true;
        middleEmulation = true;
        tapping = true;
      };
    };
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
      excludePackages = with pkgs; [
        xterm
      ];
    };
  };
  #services.xserver.synaptics.enable = true;
}
