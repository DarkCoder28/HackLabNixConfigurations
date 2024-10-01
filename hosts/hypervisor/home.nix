{
  config,
  pkgs,
  ...
}: {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home = {
    username = "hypervisor";
    homeDirectory = "/home/hypervisor";
    stateVersion = "23.11"; # DO NOT CHANGE

    sessionVariables = {
      EDITOR = "vim";
    };
  };

  imports = [
    ../../modules/home-manager/user-scripts/all.nix
    ../../modules/home-manager/util/kitty.nix
    ../../modules/home-manager/apps/defaults.nix
    ../../modules/home-manager/apps/browsers.nix
    ../../modules/home-manager/apps/vscodium.nix
    ../../modules/home-manager/bluetooth.nix
    ../../modules/home-manager/git.nix
    ../../modules/home-manager/config/theme.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
# # It is sometimes useful to fine-tune packages, for example, by applying
# # overrides. You can do that directly here, just don't forget the
# # parentheses. Maybe you want to install Nerd Fonts with a limited number of
# # fonts?
# (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
# # You can also create simple shell scripts directly inside your
# # configuration. For example, this adds a command 'my-hello' to your
# # environment:
# (pkgs.writeShellScriptBin "my-hello" ''
#   echo "Hello, ${config.home.username}!"
# '')
# home.file = {
# # Building this configuration will create a copy of 'dotfiles/screenrc' in
# # the Nix store. Activating the configuration will then make '~/.screenrc' a
# # symlink to the Nix store copy.
# ".screenrc".source = dotfiles/screenrc;
# # You can also set the file content immediately.
# ".gradle/gradle.properties".text = ''
#   org.gradle.console=verbose
#   org.gradle.daemon.idletimeout=3600000
# '';
# };
# Home Manager can also manage your environment variables through
# 'home.sessionVariables'. If you don't want to manage your shell through Home
# Manager then you have to manually source 'hm-session-vars.sh' located at
# either
#
#  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
#
# or
#
#  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
#
# or
#
#  /etc/profiles/per-user/agsheeran/etc/profile.d/hm-session-vars.sh
#

