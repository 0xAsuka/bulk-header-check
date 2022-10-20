#!/bin/bash

#Banner
echo -e "
Bulk status code scanner
Codename : EVA02 - Asuka Soryu\n"

# Variable
process=10
statuscheck(){
    curl --write-out "%{http_code} - $hostlists\n" --silent --output /dev/null $hostlists
}

if [ -z "$1" ]; then
    echo -e "Usage: $0 list.txt\n";
    exit 1
fi

# Do the jobs
for hostlists in $(cat $1);
do
    statuscheck &
    background=( $(jobs -p) )
    if (( ${#background[@]} == process )); then
        wait -n
    fi
done
wait

# Exit after done
echo  -e "\nAll jobs done. Thank you"
exit 0
