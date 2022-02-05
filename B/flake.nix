{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.A.url = "path:../A";
  inputs.A.inputs.nixpkgs.follows = "nixpkgs";
  inputs.A_alt.url = "path:../A";
  inputs.A_alt.inputs.nixpkgs.follows = "A/nixpkgs";
  outputs = { self, A, A_alt, nixpkgs } : {};
}
