export APP_PATH=iphone-template
export APP_NAME=TemplateApp

export BUCK_OPTIONS=\
	--config custom.appVersion="1.0.0" \
	--config custom.developmentCodeSignIdentity="${DEVELOPMENT_CODE_SIGN_IDENTITY}" \
	--config custom.distributionCodeSignIdentity="${DISTRIBUTION_CODE_SIGN_IDENTITY}" \
	--config custom.developmentTeam="${DEVELOPMENT_TEAM}" \
	--config custom.baseApplicationBundleId="${BUNDLE_ID}" \
	--config custom.isInternalBuild="${IS_INTERNAL_BUILD}" \
	--config custom.isAppStoreBuild="${IS_APPSTORE_BUILD}" \
	--config custom.appStoreId="${APPSTORE_ID}" \
	--config custom.buildNumber="${BUILD_NUMBER}" \
	--config custom.entitlementsApp="${ENTITLEMENTS_APP}" \
	--config custom.developmentProvisioningProfileApp="${DEVELOPMENT_PROVISIONING_PROFILE_APP}" \
	--config custom.distributionProvisioningProfileApp="${DISTRIBUTION_PROVISIONING_PROFILE_APP}" \

export BUCK_DEBUG_OPTIONS=\
	--config custom.other_cflags="-O0 -D DEBUG" \
  	--config custom.other_cxxflags="-O0 -D DEBUG" \
  	--config custom.optimization="-Onone" \
  	--config custom.config_swift_compiler_flags="-DDEBUG"

export BUCK_RELEASE_OPTIONS=\
	--config custom.other_cflags="-Os" \
  	--config custom.other_cxxflags="-Os" \
  	--config custom.optimization="-O" \
  	--config custom.config_swift_compiler_flags="-whole-module-optimization"

export BUCK_THREADS_OPTIONS=--config build.threads=$(shell sysctl -n hw.logicalcpu)

export BUCK_TESTING_OPTIONS=--config custom.config_swift_compiler_flags="-DDEBUG -enable-testing"
export BUCK_COVERAGE_OPTIONS=\
	--config custom.other_cflags="-fprofile-instr-generate -fcoverage-mapping" \
  	--config custom.other_cxxflags="-fprofile-instr-generate -fcoverage-mapping" \
  	--config custom.other_ldflags="-fprofile-instr-generate" \
  	--config custom.other_swift_compiler_flags="-profile-generate -profile-coverage-mapping"

ifneq ($(BUCK_HTTP_CACHE),)
	ifeq ($(BUCK_CACHE_MODE),)
		BUCK_CACHE_MODE=readwrite
	endif
	export BUCK_CACHE_OPTIONS=\
		--config cache.mode=http \
		--config cache.http_url="$(BUCK_HTTP_CACHE)" \
		--config cache.http_mode="$(BUCK_CACHE_MODE)"
endif

ifneq ($(BUCK_DIR_CACHE),)
	export BUCK_CACHE_OPTIONS=\
		--config cache.mode=dir \
		--config cache.dir="$(BUCK_DIR_CACHE)" \
		--config cache.dir_mode="readwrite"
endif