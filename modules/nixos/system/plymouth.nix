{
  config,
  pkgs,
  ...
}: let
  jbm = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
in {
  boot.plymouth = {
    enable = true;
    # themePackages = [
    #   (pkgs.adi1090x-plymouth-themes.override
    #     {
    #       selected_themes = ["angular_alt"];
    #     })
    # ];
    # theme = "angular_alt";
    font = "${jbm}/share/fonts/truetype/NerdFonts/JetBrainsMonoNerdFont-Regular.ttf";
  };
}
