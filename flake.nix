{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {nixpkgs,flake-utils,...}:
  flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells = {
        default = pkgs.mkShell {
          name = "cpp Shell";
          buildInputs = with pkgs;[
            typst
            typst-lsp
            typst-preview
            nodePackages.vscode-html-languageserver-bin
            nodePackages.typescript-language-server
            html-tidy
          ];
        };
      };
    });
}
