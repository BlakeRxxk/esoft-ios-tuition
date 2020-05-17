#!/bin/bash

export SOURCEKIT_LOGGING=0 && \
	../../tools/needle generate Sources/Generated/NeedleGenerated.swift Sources \
	--pluginized \
	--header-doc ../../tools/copyright_header.txt