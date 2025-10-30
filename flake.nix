{
  inputs.nixpkgs.url = "github:NixOs/nixpkgs/nixos-25.05";

  outputs =
    {
      self,
      nixpkgs,
      ...
    }:
    let
      forAllSystems = f: builtins.mapAttrs f nixpkgs.legacyPackages;
    in
    {
      packages = forAllSystems (
        system: pkgs: {
          default = self.packages.${system}.epi-tidy;
          epi-tidy = pkgs.callPackage ./nix/package.nix { };
        }
      );

      formatter = forAllSystems (_: pkgs: pkgs.nixfmt-tree);
    };
}
