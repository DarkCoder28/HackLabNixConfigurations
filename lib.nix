{inputs, ...}: let
  theLib = (import ./lib.nix) {inherit inputs;};
  outputs = inputs.self.outputs;
in rec {
  pkgsFor = sys:
    import inputs.nixpkgs {
      system = sys;
      config.allowUnfree = true;
    };

  mkSystem = config:
    inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs outputs theLib;
      };
      modules = [
        config
      ];
    };

  mkHome = sys: config:
    inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = pkgsFor sys;
      extraSpecialArgs = {
        inherit inputs theLib outputs;
      };
      modules = [
        config
      ];
    };
}
