{
  description = "Tidefell website";

  # The same nixpkgs as the pinned monorepo release; zola and mdbook are single binaries from it.
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { self, nixpkgs, ... }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f nixpkgs.legacyPackages.${system});
    in
    {
      # Shell, Nix and spelling checks over the source (ADR 0031).
      checks = forAllSystems (
        pkgs:
        let
          lint =
            name: tools: script:
            pkgs.runCommand name { nativeBuildInputs = tools; } ''
              cd ${self}
              ${script}
              touch $out
            '';
        in
        {
          shellcheck = lint "shellcheck" [ pkgs.shellcheck ] ''
            find . -name '*.sh' -print0 | xargs -0 --no-run-if-empty shellcheck
          '';
          statix = lint "statix" [ pkgs.statix ] "statix check .";
          deadnix = lint "deadnix" [ pkgs.deadnix ] "deadnix --fail .";
          typos = lint "typos" [ pkgs.typos ] "typos";
        }
      );

      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShell {
          packages = with pkgs; [
            zola
            gh
          ];
        };
      });
    };
}
