#!/bin/bash
echo "# Simple Massive HTTP Header Status Checker";
echo "# usage: bash bulk-header.sh target.txt";
file=$1
while IFS= read bulk
do
  curl -o /dev/null --silent --head --write-out "%{http_code} - $bulk\n" "$bulk"
done < "$file"
exit 0
