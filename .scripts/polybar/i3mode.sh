#!/bin/bash

mode_path=/tmp/current-i3-mode
writeoff() {
	echo "OFF" > $mode_path
}

trap writeoff SIGINT SIGTERM
echo "default" > $mode_path

i3-msg -t subscribe -m '[ "mode" ]' | while read -r line; do
    new_output=$(echo "$line" | jq -r '.change')
		if [ "$new_output" != "$buffer" ]; then
        buffer="$new_output"
        echo "$buffer" > $mode_path
    fi
done

