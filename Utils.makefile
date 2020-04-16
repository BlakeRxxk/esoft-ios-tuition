
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

install_buck:
	curl https://jitpack.io/com/github/airbnb/buck/4bd1a08625454c5034eb6ef6193e94f9e6e62a62/buck-4bd1a08625454c5034eb6ef6193e94f9e6e62a62.pex --output tools/buck
	chmod u+x tools/buck

install_pods:
	cd third-party && bundle exec pod install && cd ..

check_env:
ifndef BUCK
	$(error BUCK is not set)
endif
	sh tools/scripts/check_env.sh

kill_xcode:
	killall Xcode || true

audit:
	$(BUCK) audit rules apps/$(APP_PATH)/BUCK > config/gen/$(APP_PATH)-BUCK.py ${BUCK_OPTIONS} ${BUCK_DEBUG_OPTIONS} ${BUCK_THREADS_OPTIONS} ${BUCK_CACHE_OPTIONS}
