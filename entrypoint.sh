#!/bin/bash
set -e

cd "$INPUT_WORKING_DIRECTORY"

if ( [ ! -f "${INPUT_MAIN_FILE}" ] &&  $INPUT_MAIN_FILE != *.json ] ]); then
    echo "${INPUT_MAIN_FILE} does not exit in the working directory (${INPUT_WORKING_DIRECTORY})"
    exit 1
fi

if [[ ! -f "${INPUT_VARIABLE_FILE}" ]] && [[ $INPUT_VARIABLE_FILE != *.json ]] && [[ $INPUT_VARIABLE_FILE != "" ]]; then
    echo "$INPUT_VARIABLE_FILE not found in the working directory (${INPUT_WORKING_DIRECTORY})"
    exit 1
fi

var_command=""
if [ -f "$INPUT_VARIABLE_FILE" ]; then
    var_command="-var-file=$INPUT_VARIABLE_FILE"
fi

echo "Beginning running packer build ..."
packer build ${var_command} ${INPUT_MAIN_FILE}