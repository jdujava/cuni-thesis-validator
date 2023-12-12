#!/bin/sh

set -e

pdf_file="$1"

validationReport=$(verify "$pdf_file")
echo "$validationReport"

isValid=$(echo "$validationReport" | awk -F'"' '/validationReports/{print $2}')
echo "is_valid=$isValid" >> "$GITHUB_OUTPUT"

if [ "$isValid" -eq "0" ]; then
  echo "PDF file is NOT valid!"
  exit 1
fi
