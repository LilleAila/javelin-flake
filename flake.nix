{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    javelin-steno = {
      url = "github:jthlim/javelin-steno";
      flake = false;
    };

    javelin-steno-pico = {
      url = "github:jthlim/javelin-steno-pico";
      flake = false;
    };
  };

  outputs =
    { nixpkgs, self, ... }@inputs:
    let
      inherit (nixpkgs) lib;
      systems = lib.systems.flakeExposed;
      pkgsFor = lib.genAttrs systems (system: import nixpkgs { inherit system; });
      forEachSystem = f: lib.genAttrs systems (system: f pkgsFor.${system});
    in
    {
      devShells = forEachSystem (pkgs: {
        default = pkgs.mkShell {
          packages = with pkgs; [
            nixd
            nixfmt-rfc-style
            statix
          ];
        };
      });

      packages = forEachSystem (pkgs: {
        default = pkgs.callPackage ./package.nix { inherit (inputs) javelin-steno javelin-steno-pico; };
      });
    };
}
