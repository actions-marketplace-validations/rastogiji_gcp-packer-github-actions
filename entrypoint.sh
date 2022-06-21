#!/bin/bash
set -e

cd "$INPUT_WORKINGDIRECTORY"

if ( [ ! -f "${INPUT_MAINFILE}" ] &&  $INPUT_MAINFILE != *.json ] ]); then
    echo "${INPUT_MAINFILE} does not exit in the working directory (${INPUT_WORKINGDIRECTORY})"
    exit 1
fi

if [[ ! -f "${INPUT_VARIABLEFILE}" ]] && [[ $INPUT_VARIABLEFILE != *.json ]]; then
    echo "$INPUT_VARIABLEFILE not found in the working directory (${INPUT_WORKINGDIRECTORY})"
    exit 1
fi

var_command=""
if [ -f "$INPUT_VARIABLEFILE" ]; then
    var_command="-var-file=$INPUT_VARIABLEFILE"
fi

echo "Beginning running packer build ..."
packer build ${var_command} ${INPUT_MAINFILE}