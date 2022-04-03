#!/bin/sh

set -e

pdf_file="$1"
working_directory="$2"

if [ -n "$working_directory" ]; then
  cd "$working_directory"
fi

verify "$pdf_file"

validationReport=$(verify "$pdf_file" | grep validationReports)
echo ::set-output name=is_valid::$validationReport
