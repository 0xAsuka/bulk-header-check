#!/bin/bash
echo "Usage: bash bulk-response.sh list.txt"
for hostlists in $(cat $1);
do
	curl -s -o /dev/null -I -w "[%{http_code}] $hostlists\n" "$hostlists"
done
