#!/bin/bash

MYDIR="$(cd "$(dirname "$0")"; pwd)"
clj "$MYDIR/demand.clj" $@
