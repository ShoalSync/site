{
  description = "Tidefell website";

  # The same nixpkgs as the pinned monorepo release; zola and mdbook are single binaries from it.
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  # The monorepo release whose documentation is served under /docs/ (ADR 0013): its source, from
  # which the book is built here. Bump the tag to serve a newer release.
  inputs.tidefell = {
    url = "git+ssh://git@github.com/ShoalSync/shoal?ref=refs/tags/v0.21.0";
    flake = false;
  };

  outputs =
    {
      self,
      nixpkgs,
      tidefell,
      ...
    }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f nixpkgs.legacyPackages.${system});
      version = (builtins.fromTOML (builtins.readFile "${tidefell}/Cargo.toml")).workspace.package.version;
    in
    {
      packages = forAllSystems (pkgs: rec {
        # The pinned release's book. It includes files from elsewhere in the monorepo (specs, the
        # example configuration), so it is built from the whole source.
        docs = pkgs.runCommand "tidefell-docs-${version}" { nativeBuildInputs = [ pkgs.mdbook ]; } ''
          cp -R ${tidefell} src
          chmod -R u+w src
          mdbook build src/docs --dest-dir "$out"
        '';

        # The site with the book at /docs/<version>/ and /docs/latest/.
        site = pkgs.stdenvNoCC.mkDerivation {
          pname = "tidefell-site";
          inherit version;
          src = self;
          nativeBuildInputs = [ pkgs.zola ];
          # zola builds an HTTP client at start, which needs CA certificates even offline.
          SSL_CERT_FILE = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";
          buildPhase = ''
            bash scripts/docs.sh ${docs} ${version}
            zola build --output-dir "$out"
          '';
          dontInstall = true;
        };
        default = site;
      });

      # Shell, Nix and spelling checks over the source (ADR 0031), and the built site's links.
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
          links =
            pkgs.runCommand "links"
              {
                nativeBuildInputs = [ pkgs.zola ];
                SSL_CERT_FILE = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";
              }
              ''
            cp -R ${self} src
            chmod -R u+w src
            cd src
            bash scripts/docs.sh ${self.packages.${pkgs.stdenv.hostPlatform.system}.docs} ${version}
            zola check --skip-external-links
            touch $out
          '';
        }
      );

      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShell {
          packages = with pkgs; [
            zola
            mdbook
          ];
        };
      });
    };
}
