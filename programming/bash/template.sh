#!/usr/bin/env bash

set -e

function usage() {
  cat <<EOF
---
USAGE
$0 --arg <value> [-h]
<USAGE DESCRIPTION>
Required arguments:
--arg <ARG DESCRIPTION>
Optional flags:
-h  Show this help message.
EOF
}

function fail() {
  if [ -n "$1" ]; then
    echo "ERROR: $1"
  fi

  if [ -z "$2" ]; then
    echo ""
    usage
  fi

  if [ -n "$1" ]; then
    exit 1
  fi
}

# Check for required executables
required_executables="<SPACE SEPARATED EXECUTABLES>"

for required_executable in $required_executables; do
  if ! command -v "$required_executable" &>/dev/null; then
    fail "Required executable '$required_executable' not found." "skip"
  fi
done

# Parse arguments
while [ $# -gt 0 ]; do
  case "$1" in
  --kubernetes_version=*)
    kubernetes_version="${1#*=}"
    ;;
  -h)
    usage && exit
    ;;
  *)
    fail "Invalid arguments. See usage."
    ;;
  esac
  shift
done

# Check for required arguments
if [[ -z "$kubernetes_version" ]]; then
  fail "Kubernetes version not set as argument. See usage."
fi

# Simple for loop over array in Bash
list="elem1 elem2"

for elem in $list; do
  echo "$elem"
done
