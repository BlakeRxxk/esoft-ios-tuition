#!/bin/bash

if [ -z "$ESOFT_ENV_SET" ]; then
	echo "Error: Build environment is not set up. Use sh public.sh make ${command}"
	exit 1
fi
