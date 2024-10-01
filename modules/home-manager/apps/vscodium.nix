{
  config,
  home,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    vscodium-fhs
    alejandra
    nil
  ];
  programs.vscode = {
    package = pkgs.vscodium-fhs;
    enable = true;
    enableExtensionUpdateCheck = true;
    userSettings = {
      "editor.fontSize" = 12;
      "editor.fontFamily" = "'JetBrainsMono Nerd Font', 'Droid Sans Mono', 'monospace', monospace";
      "git.autofetch" = true;
      "git.enableSmartCommit" = true;
      "rust-client.engine" = "rust-analyzer";
      "git.confirmSync" = false;
      "git.openRepositoryInParentFolders" = "always";
      "explorer.confirmDragAndDrop" = false;
      "redhat.telemetry.enabled" = false;
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nil";
    };
    keybindings = [
      {
        key = "ctrl+shift+s";
        command = "workbench.action.files.saveFiles";
      }
    ];
    extensions = with pkgs; [
      vscode-extensions.kamadorueda.alejandra
      vscode-extensions.arrterian.nix-env-selector
      vscode-extensions.jnoortheen.nix-ide
      vscode-extensions.streetsidesoftware.code-spell-checker
      vscode-extensions.eamodio.gitlens
      vscode-extensions.esbenp.prettier-vscode
      vscode-extensions.redhat.vscode-yaml
      vscode-extensions.redhat.vscode-xml
    ];
  };
}
