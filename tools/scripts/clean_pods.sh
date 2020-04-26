#!/bin/bash

rm -rf ./third-party/Podfile.lock
rm -rf ./third-party/Pods
mkdir ./third-party/Pods
rsync -av --ignore-existing ./tools/BuckSupport/ ./third-party/Pods/
mv ./third-party/Pods/BUCK_PODS ./third-party/Pods/BUCK