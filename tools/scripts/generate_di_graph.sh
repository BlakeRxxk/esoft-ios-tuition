#!/bin/bash

OUTPUT=../../tools/feature_list.txt

if [ ! -f "$OUTPUT" ]; then
    echo "$OUTPUT does not exist"
    echo "creating new one"
   	touch $OUTPUT
else
	cp /dev/null $OUTPUT
fi

FEATURES_PATH=../../features
INTEGRATIONS_PATH=../../integrations

FEATURES_LIST=( $(find $FEATURES_PATH -name \*Sources -type d) )
INTEGRATIONS_LIST=( $(find $INTEGRATIONS_PATH -name \*Sources -type d) )

for feature in "${FEATURES_LIST[@]}"
do
   echo "${feature}/" >> $OUTPUT
done

for integration in "${INTEGRATIONS_LIST[@]}"
do
   echo "${integration}/" >> $OUTPUT
done

export SOURCEKIT_LOGGING=0 && \
	../../tools/needle generate Sources/Generated/NeedleGenerated.swift Sources/ ../../tools/feature_list.txt \
	--pluginized \
	--header-doc ../../tools/copyright_header.txt