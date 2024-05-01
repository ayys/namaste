{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: {

    defaultPackage.x86_64-linux =
      with import nixpkgs { system = "x86_64-linux"; };
      stdenv.mkDerivation {
        name = "namaste";
        src = self;
        buildPhase = "make namaste";
        installPhase = "mkdir -p $out/bin; install -t $out/bin namaste";
      };
  };
}
