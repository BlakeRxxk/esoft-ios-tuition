#!/bin/bash

PODS_ROOT=/third-party/Pods
SUPPORT_DIR=/third-party/Pods/BuckSupport
BUCK_FILE=/third-party/Pods/BUCK

if [ ! -f "$PODS_ROOT" ]; then
    echo "$PODS_ROOT does not exist"
    echo "creating new one"
    mkdir ./third-party/Pods
    rsync -av --ignore-existing ./tools/BuckSupport/ ./third-party/Pods/
    mv ./third-party/Pods/BUCK_PODS ./third-party/Pods/BUCK
fi

cd third-party && bundle exec pod install && cd ..