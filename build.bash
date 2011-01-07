#!/bin/bash

# replace fsharpc with a call to mono 2.8+
function fsc () {

   # compiled mono
#   MONO="/code/3p/mono-world/bin/mono"
   
   # environment
#   source "/code/3p/mono-world/mono-dev-env.bash"

   # fsc
#   "$MONO" /usr/lib/fsharp/fsc.exe --resident "$@"
   mono /usr/lib/fsharp/fsc.exe --nologo   \
                                --optimize \
                                --resident \
                                "$@"
}

# F#
fsc -o demand-fs.exe demand.fs
fsc -o eager-fs.exe eager.fs
chmod +x demand-fs.exe eager-fs.exe

# Haskell
ghc -O2 -o demand-hs.exe --make demand.hs
ghc -O2 -o eager-hs.exe --make eager.hs
chmod +x demand-hs.exe eager-hs.exe

# Clojure
