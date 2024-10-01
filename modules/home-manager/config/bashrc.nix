{
  config,
  home,
  pkgs,
  ...
}: {
  home.file.".bashrc".source = ./bashrc/.bashrc;
  home.file.".config/oh-my-posh/theme.omp.json".source = ./bashrc/atomic.omp.json;
}
