#!/usr/bin/env bash
wasi_bin_path="$WASI_SDK_PATH/bin"
wasi_self=$(basename "$0")
wasi_cmd="$1"
if [ $# -eq 0 ]; then
  echo "Usage: $wasi_self executable [arguments]"
  exit 1
fi
if [ ! -f "$wasi_bin_path/$wasi_cmd" ]; then
  echo "Error: $wasi_cmd is not a valid executable in $wasi_bin_path"
  exit 2
fi
shift
"$wasi_bin_path/$wasi_cmd" "$@"
