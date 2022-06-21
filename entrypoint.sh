#!/bin/bash
set -e

cd "$INPUT_WORKING_DIRECTORY"

# Checking whether Main File exists and is a json file
if [[ ! -f "${INPUT_MAIN_FILE}" ]] && [[ $INPUT_MAIN_FILE != *.json ]]; then
    echo "Could Not find ${INPUT_MAIN_FILE} in (${INPUT_WORKING_DIRECTORY})."
    exit 1
fi

# Checking whether Variable file exists and is a json file
if [[ ! -f "${INPUT_VARIABLE_FILE}" ]] && [[ $INPUT_VARIABLE_FILE != *.json ]]; then
    echo "Could not find $INPUT_VARIABLE_FILE in (${INPUT_WORKING_DIRECTORY})"
    exit 1
fi

# Creating -var-file argument if variable file exists
var_command=""
if [[ -f "$INPUT_VARIABLE_FILE" ]]; then
    var_command="-var-file=$INPUT_VARIABLE_FILE"
fi

# Running Packer Build
echo "Beginning running packer build ..."
packer build ${var_command} ${INPUT_MAIN_FILE}