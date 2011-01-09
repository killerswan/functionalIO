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
cd fs
echo "Building F# (on demand)..."
time fsc -o demand-fs.exe demand.fs
echo "Building F# (eager)..."
time fsc -o eager-fs.exe eager.fs
chmod +x demand-fs.exe eager-fs.exe
cd ..

# Haskell
cd hs
echo "Building Haskell (on demand)..."
time ghc -O2 -o demand-hs.exe --make demand.hs
echo "Building Haskell (eager)..."
time ghc -O2 -o eager-hs.exe --make eager.hs
chmod +x demand-hs.exe eager-hs.exe
cd ..

# Clojure
# ha! nothing!

# golang
cd go
echo "Building Go (buffered): compiling..."
time 6g xor.go
echo "Building Go (buffered): linking..."
time 6l -o xor xor.6
cd ..




