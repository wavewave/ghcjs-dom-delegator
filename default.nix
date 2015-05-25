{ mkDerivation, base, ghcjs-base, ghcjs-ffiqq, ghcjs-prim, split
, stdenv, template-haskell
}:
mkDerivation {
  pname = "ghcjs-dom-delegator";
  version = "0.0";
  src = ./.;
  buildDepends = [
    base ghcjs-base ghcjs-ffiqq ghcjs-prim split template-haskell
  ];
  description = "Experimental dom-delegator bindings for GHCJS";
  license = stdenv.lib.licenses.mit;
}
