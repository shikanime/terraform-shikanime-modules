{
  description = "Shikanime's Terraform modules";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-23.05";
    devenv = {
      url = "github:cachix/devenv";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  nixConfig = {
    extra-public-keys = [
      "shikanime.cachix.org-1:OrpjVTH6RzYf2R97IqcTWdLRejF6+XbpFNNZJxKG8Ts="
      "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
    ];
    extra-substituters = [
      "https://shikanime.cachix.org"
      "https://devenv.cachix.org"
    ];
  };

  outputs =
    { nixpkgs, devenv, ... }@inputs:
    let
      systems = [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-darwin"
        "x86_64-linux"
      ];
    in
    {
      devShells = nixpkgs.lib.genAttrs systems (system:
        let pkgs = import nixpkgs { inherit system; }; in {
          default = devenv.lib.mkShell {
            inherit inputs pkgs;
            modules = [
              {
                pre-commit.hooks = {
                  markdownlint.enable = true;
                  shfmt.enable = true;
                  nixpkgs-fmt.enable = true;
                  statix.enable = true;
                  deadnix.enable = true;
                  prettier.enable = true;
                  actionlint.enable = true;
                };
                packages = [
                  pkgs.nixpkgs-fmt
                  pkgs.qemu
                  pkgs.gh
                  pkgs.glab
                ];
              }
              {
                pre-commit.hooks.terraform-format.enable = true;
                packages = [
                  pkgs.terraform
                  pkgs.google-cloud-sdk
                ];
              }

            ];
          };
        }
      );
    };
}
