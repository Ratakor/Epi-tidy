{
  lib,
  stdenv,
}:
let
  fs = lib.fileset;
in
stdenv.mkDerivation (finalAttrs: {
  pname = "epi-tidy";
  version = "0.0.0";

  src = fs.toSource {
    root = ../.;
    fileset = fs.unions [
      ../src
      ../include
      ../Makefile
    ];
  };

  installFlags = [ "PREFIX=$(out)" ];

  meta = {
    homepage = "https://github.com/Lepotototor/Epi-tidy";
    mainProgram = "epi-tidy";
  };
})
