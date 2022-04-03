#!/bin/sh

set -e

pdf_file="$1"
working_directory="$2"

if [ -n "$working_directory" ]; then
  cd "$working_directory"
fi

verify "$pdf_file"

validationReport=$(verify "$pdf_file" | awk -F'"' '/validationReports/{print $2}')
echo "::set-output name=is_valid::$validationReport"

if [ "$validationReport" -eq "0" ]; then
  echo "PDF file is NOT valid!"
  exit 1
fi
