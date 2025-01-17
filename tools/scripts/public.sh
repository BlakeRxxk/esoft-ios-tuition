#!/bin/bash

source ./tools/scripts/private.sh

export ESOFT_ENV_SET="1"

export DEVELOPMENT_CODE_SIGN_IDENTITY=$PRIVATE_DEVELOPMENT_CODE_SIGN_IDENTITY
export DISTRIBUTION_CODE_SIGN_IDENTITY=$PRIVATE_DISTRIBUTION_CODE_SIGN_IDENTITY

export DEVELOPMENT_TEAM=$PRIVATE_DEVELOPMENT_TEAM

export BUNDLE_ID="com.esoft.TemplateApp"
export IS_INTERNAL_BUILD="false"
export IS_APPSTORE_BUILD="true"
export APPSTORE_ID=$PRIVATE_APPSTORE_ID

export BUILD_NUMBER="1"

# if [ -z "$BUILD_NUMBER" ]; then
# 	echo "BUILD_NUMBER is not defined"
# 	exit 1
# fi

export ENTITLEMENTS_APP=$PRIVATE_ENTITLEMENTS_APP
export DEVELOPMENT_PROVISIONING_PROFILE_APP=$PRIVATE_DEVELOPMENT_PROVISIONING_PROFILE_APP
export DISTRIBUTION_PROVISIONING_PROFILE_APP=$PRIVATE_DISTRIBUTION_PROVISIONING_PROFILE_APP

BUILDBOX_DIR="buildbox"

export CODESIGNING_PROFILES_VARIANT="appstore"
export PACKAGE_METHOD="appstore"
