.PHONY : check_env kill_xcode

# Use local version of Buck
BUCK=tools/buck
xctool=tools/xctool/bin/xctool
swiftlint=Pods/SwiftLint/swiftlint

include User.makefile
include Utils.makefile

BUCK_OPTIONS=\
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

clean: kill_xcode
	rm -rf **/**/*.xcworkspace
	rm -rf **/**/*.xcodeproj
	rm -rf **/*.xcworkspace
	rm -rf **/*.xcodeproj
	rm -rf *.xcworkspace
	rm -rf *.xcodeproj
	rm -rf buck-out

debug:
	$(BUCK) install //apps/$(APP_PATH):$(APP_NAME)#dwarf-and-dsym,shared \
	${BUCK_OPTIONS} ${BUCK_DEBUG_OPTIONS} ${BUCK_THREADS_OPTIONS} ${BUCK_CACHE_OPTIONS} \
	--run --simulator-name 'iPhone 8'

project_debug: check_env kill_xcode
	$(BUCK) project //apps/$(APP_PATH):workspace \
		--config custom.mode=project ${BUCK_OPTIONS} ${BUCK_DEBUG_OPTIONS} ${BUCK_TESTING_OPTIONS}

project_ci: check_env kill_xcode
	$(BUCK) project //apps/$(APP_PATH):workspace \
		--config custom.mode=project ${BUCK_OPTIONS} ${BUCK_DEBUG_OPTIONS}

build_debug: check_env
	$(BUCK) build \
	//apps/$(APP_PATH):AppPackage#iphoneos-arm64,iphoneos-armv7 \
	//apps/$(APP_PATH):$(APP_NAME)#dwarf-and-dsym,iphoneos-arm64,iphoneos-armv7 \
	${BUCK_OPTIONS} ${BUCK_DEBUG_OPTIONS} ${BUCK_THREADS_OPTIONS} ${BUCK_CACHE_OPTIONS}

build_test: check_env
	$(BUCK) build \
	//apps/$(APP_PATH):AppPackage \
	//apps/$(APP_PATH):$(APP_NAME)#dwarf-and-dsym,iphoneos-arm64,iphoneos-armv7 \
	--verbose 7 ${BUCK_OPTIONS} ${BUCK_DEBUG_OPTIONS} ${BUCK_THREADS_OPTIONS}

project: project_debug
	open apps/$(APP_PATH)/$(APP_NAME)_Buck.xcworkspace

buck_out = $(shell $(BUCK) root)/buck-out
tests:
	@rm -f $(buck_out)/tmp/*.profraw
	@rm -f $(buck_out)/gen/*.profdata
	$(BUCK) test //apps/$(APP_PATH):$(APP_NAME)CITests \
		--config custom.mode=project \
		--test-runner-env XCTOOL_TEST_ENV_LLVM_PROFILE_FILE="$(buck_out)/tmp/code-%p.profraw%15x" \
		${BUCK_OPTIONS} ${BUCK_DEBUG_OPTIONS} ${BUCK_THREADS_OPTIONS} \
		${BUCK_CACHE_OPTIONS} ${BUCK_COVERAGE_OPTIONS} ${BUCK_TESTING_OPTIONS}
	xcrun llvm-profdata merge -sparse "$(buck_out)/tmp/code-"*.profraw -o "$(buck_out)/gen/Coverage.profdata"
	xcrun llvm-cov report "$(buck_out)/gen/apps/$(APP_PATH)/AppBinary#iphonesimulator-x86_64" -instr-profile "$(buck_out)/gen/Coverage.profdata" -ignore-filename-regex "Pods|Carthage|buck-out"


xcode_tests: build_test
	$(xctool) -workspace apps/$(APP_PATH)/$(APP_NAME)_Buck.xcworkspace \
		   -scheme $(APP_PATH) \
		   -destination 'platform=iOS Simulator,name=iPhone 11 Pro Max,OS=latest' \
		   -sdk iphonesimulator \
		   run-tests -parallelize \
		   -reporter pretty \
		   TEST_FRAMEWORK_SEARCH_PATHS=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/lib/

targets:
	$(BUCK) targets //... ${BUCK_OPTIONS} ${BUCK_DEBUG_OPTIONS}

audit:
	$(BUCK) audit rules apps/$(APP_PATH)/BUCK > config/gen/$(APP_PATH)-BUCK.py ${BUCK_OPTIONS} ${BUCK_DEBUG_OPTIONS} ${BUCK_THREADS_OPTIONS} ${BUCK_CACHE_OPTIONS}

lint:
	${swiftlint} lint

autocorrect:
	${swiftlint} autocorrect