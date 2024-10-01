{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable"; #23.11

    home-manager = {
      url = "github:nix-community/home-manager"; #/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    # pkgs = import nixpkgs {
    #   inherit system;
    #   config.allowUnfree = true;
    # };
    # pkgs = nixpkgs.legacyPackages.${system};
    theLib = import ./lib.nix {inherit inputs;};
  in
    with theLib; {
      nixosConfigurations = {
        hypervisor = mkSystem ./hosts/hypervisor/configuration.nix;
      };
      homeConfigurations = {
        "hypervisor@hypervisor" = mkHome system ./hosts/hypervisor/home.nix;
      };
    };
}
