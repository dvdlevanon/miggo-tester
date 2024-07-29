#!/bin/bash

unmask_arg=$1

function replace_token() {
	local search=$1
	local replace=$2
	
	if [ "$unmask_arg" == "unmask" ]; then
		local temp=$search
		search=$replace
		replace=$temp
	fi
	
	find . -type f ! -name "mask.sh" -exec sed -i "s|$search|$replace|g" {} +
}

replace_token "password: \"$MIGGO_DOCKER_REGISTRY_TOKEN\"" "password: \"<masked>\""
replace_token "Authorization: Basic $MIGGO_BASIC_AUTH_TOKEN" "Authorization: Basic <masked>"
replace_token "accessKeyId: \"$MIGGO_AWS_KEY_ID\"" "accessKeyId: \"<masked>\""
replace_token "secretAccessKey: \"$MIGGO_AWS_SECRET\"" "secretAccessKey: \"<masked>\""
replace_token ".dockerconfigjson: $MIGGO_DOCKER_SECRETS" ".dockerconfigjson: <masked>"
