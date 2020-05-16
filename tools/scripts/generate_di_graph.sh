#!/bin/bash

export SOURCEKIT_LOGGING=0 && \
	../../tools/needle generate Sources/Generated/NeedleGenerated.swift Sources/ ../../tools/feature_list.txt \
	--pluginized \
	--header-doc ../../tools/copyright_header.txt