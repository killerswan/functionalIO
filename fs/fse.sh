#!/bin/sh
MYDIR="$(cd "$(dirname "$0")"; pwd)"
mono "$MYDIR"/eager-fs.exe $@
