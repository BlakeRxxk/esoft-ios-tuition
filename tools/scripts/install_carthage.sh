#!/bin/bash

if ! [ -x "$(command -v carthage)" ]; then
  echo 'Error: carthage is not installed.' >&2
  exit 1
fi

cd third-party && carthage update --cache-builds --platform iOS && cd ..