{
  config,
  home,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    git
  ];
  programs.git = {
    enable = true;
    userName = "agsheeran";
    userEmail = "agsheeran@duck.com";
    lfs.enable = true;
    extraConfig = {
      credential.helper = "${
        pkgs.git.override {withLibsecret = true;}
      }/bin/git-credential-libsecret";
    };
  };
}
