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
      ./demand-hs.exe
      ./demand-fs.exe  
      ./eager-hs.exe
      ./eager-fs.exe
      ./run-clj.sh
   )

   # run a set of tests

   echo "File: \"$1\""
   echo ""

   for E in "${EXES[@]}" 
   do
      testprog "$E" "$1"
      echo ""
   done
}



# tests
#batch ~/Desktop/TWiV114.mp3 # 60.6 MB
#echo "<!-- --------------------------------- -->"
#batch /code/3p/ChromeOS/chromeos # 238 MB
#echo "<!-- --------------------------------- -->"
batch /code/3p/linux/ubuntu-10.10-desktop-amd64.iso # 695 MB
#echo "<!-- --------------------------------- -->"
#batch /code/3p/linux/2xu.1400
#echo "<!-- --------------------------------- -->"
#batch /code/3p/linux/4xu.2800
#echo "<!-- --------------------------------- -->"
#batch /code/3p/linux/8xu.5600











