{
  config,
  pkgs,
  ...
}: {
  services.printing = {
    enable = true;
    drivers = with pkgs; [
      gutenprint
      hplipWithPlugin
      brlaser
      brgenml1lpr
      brgenml1cupswrapper
    ];
  };
}
