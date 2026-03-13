{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = with pkgs; [
    marp-cli
    mermaid-cli
  ];
}
