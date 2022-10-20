#!/bin/bash
if [ -z "$1" ]; then
    echo -e "Usage: $0 list.txt\n";
    exit
fi

#Banner
echo -e "
Bulk status code scanner                  
Codename : EVA02 - Asuka Soryu\n"  

process=10
statuscheck(){
    curl --write-out "%{http_code} - $hostlists\n" --silent --output /dev/null $hostlists
}
for hostlists in $(cat $1);
do
    statuscheck &
    background=( $(jobs -p) )
    if (( ${#background[@]} == process )); then
        wait -n
    fi
done
wait
