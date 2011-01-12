#!/bin/bash

ME="$(basename "$0")"

function testprog () {
   if [[ $# -ne 2 || ! -x "$1" || ! -r "$2" ]]
   then
      echo "$ME: Usage: testprog() EXE FILENAME"
      return 1
   fi

   # run a test
   time "$1" "$2"
}

function batch () {
   if [[ $# -ne 1 || ! -r "$1" ]]
   then
      echo "$ME: Usage: batch() FILENAME"
      return 1
   fi
   
   # executables to test
   EXES=(
      ./hs/demand-hs.exe
#      ./hs/eager-hs.exe
      ./demand-fs.sh  
      ./eager-fs.sh
#      ./run-clj.sh
      ./go/xor
   )

   # run a set of tests
   echo "==> file: \"$1\"..."
   echo ""

   for E in "${EXES[@]}" 
   do

      # now lets clean up the swap a bit before each run
      # i think anything after a large eager haskell run needs it!
      sleep 30
      for EE in "${EXES[@]}" 
      do
         "$EE" /home/kcantu/iporn1.jpg > /dev/null
      done
      
      # now lets do a run
      echo "--> executing: \"$E\"..."
      testprog "$E" "$1"
      echo ""
   done
}

# test files
FILES=(
   ~/Desktop/twiv111.mp4 # 130 MB
   /code/3p/ChromeOS/chromeos # 238 MB
   /code/3p/linux/ubuntu-10.10-desktop-amd64.iso # 695 MB
   /code/3p/linux/2xu.1400 # twice that
   /code/3p/linux/4xu.2800
   /code/3p/linux/8xu.5600
)

# run tests on each program with each file
for FILE in "${FILES[@]}"
do
   batch "$FILE"
done

