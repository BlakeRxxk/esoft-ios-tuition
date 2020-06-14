
install_buck:
	curl https://jitpack.io/com/github/airbnb/buck/4bd1a08625454c5034eb6ef6193e94f9e6e62a62/buck-4bd1a08625454c5034eb6ef6193e94f9e6e62a62.pex --output tools/buck
	chmod u+x tools/buck

install_pods:
	sh tools/scripts/install_pods.sh

clean_pods:
	sh tools/scripts/clean_pods.sh

install_carthage:
	sh tools/scripts/install_carthage.sh

clean_carthage:
	sh tools/scripts/clean_carthage.sh

install_third_party: install_pods install_carthage
clean_third_party: clean_pods clean_carthage

check_env:
ifndef BUCK
	$(error BUCK is not set)
endif
	sh tools/scripts/check_env.sh

kill_xcode:
	killall Xcode || true
	killall Simulator || true

audit:
	$(BUCK) audit rules apps/$(APP_PATH)/BUCK > config/gen/$(APP_PATH)-BUCK.py \
	${BUCK_OPTIONS} ${BUCK_DEBUG_OPTIONS} ${BUCK_THREADS_OPTIONS} ${BUCK_CACHE_OPTIONS}

clean: kill_xcode
	rm -rf **/**/*.xcworkspace
	rm -rf **/**/*.xcodeproj
	rm -rf **/*.xcworkspace
	rm -rf **/*.xcodeproj
	rm -rf *.xcworkspace
	rm -rf *.xcodeproj
	rm -rf buck-out

lint:
	${swiftlint} lint

autocorrect:
	${swiftlint} autocorrect