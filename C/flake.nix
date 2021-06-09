{
  inputs.B.url = "path:../B";
  inputs.B.inputs.nixpkgs.follows = "B/A/nixpkgs";
  # the nixpkgs input here only required because of how
  # B/A/nixpkgs follows nixpkgs instead of B/nixpkgs
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  outputs = { self, nixpkgs, B }:
  # the following is just trying out
  # the way mvnetbiz pointed out to get
  # the exact version of a transitive dependency
  let
    system = "x86_64-linux";
    pkgs = import B.inputs.nixpkgs {
      inherit system;
    };
  in
  {
    defaultPackage."${system}" = pkgs.hello;
  };
}
