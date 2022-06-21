#!/bin/bash
set -e

# Changing Directory to the Input Working Directory
cd "$INPUT_WORKING_DIRECTORY"

# Checking whether Main File exists and is a json file
if [[ ! -f "${INPUT_MAIN_FILE}" ]] && [[ $INPUT_MAIN_FILE != *.json ]]; then
    echo "Could Not find ${INPUT_MAIN_FILE} in (${INPUT_WORKING_DIRECTORY})."
    exit 1
fi

var_command=""

# Checking whether Variable file exists and is a json file
if [[ ! -f "${INPUT_VARIABLE_FILE}" ]] && [[ $INPUT_VARIABLE_FILE != *.json ]]; then
    echo "Could not find $INPUT_VARIABLE_FILE in (${INPUT_WORKING_DIRECTORY})"
    exit 1
else
    var_command="-var-file=$INPUT_VARIABLE_FILE"
fi

# Running Packer Build
echo "packer build ${var_command} ${INPUT_MAIN_FILE} ${INPUT_ARGUMENTS}"
packer build ${var_command} ${INPUT_MAIN_FILE} ${INPUT_ARGUMENTS}