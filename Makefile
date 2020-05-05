.PHONY : check_env kill_xcode

# Use local version of Buck
BUCK=tools/buck
buck_out = $(shell $(BUCK) root)/buck-out
xctool=tools/xctool/bin/xctool
swiftlint=third-party/Pods/SwiftLint/swiftlint

include tools/includes/Options.makefile
include tools/includes/Utils.makefile

targets:
	$(BUCK) targets //... ${BUCK_OPTIONS} ${BUCK_DEBUG_OPTIONS}

project: project_debug
	open apps/$(APP_PATH)/$(APP_NAME)_Buck.xcworkspace

project_debug: check_env kill_xcode
	$(BUCK) project //apps/$(APP_PATH):workspace \
		--config custom.mode=project ${BUCK_OPTIONS} ${BUCK_DEBUG_OPTIONS} ${BUCK_TESTING_OPTIONS}

project_ci: check_env kill_xcode
	$(BUCK) project //apps/$(APP_PATH):workspace \
		--config custom.mode=project ${BUCK_OPTIONS} ${BUCK_DEBUG_OPTIONS}

debug:
	$(BUCK) install //apps/$(APP_PATH):$(APP_NAME)#dwarf-and-dsym,shared \
	${BUCK_OPTIONS} ${BUCK_DEBUG_OPTIONS} ${BUCK_THREADS_OPTIONS} ${BUCK_CACHE_OPTIONS} \
	--run --simulator-name 'iPhone 8'

build_debug: check_env
	$(BUCK) build \
	//apps/$(APP_PATH):AppPackage \
	//apps/$(APP_PATH):$(APP_NAME)#dwarf-and-dsym \
	${BUCK_OPTIONS} ${BUCK_DEBUG_OPTIONS} ${BUCK_THREADS_OPTIONS} ${BUCK_CACHE_OPTIONS}

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