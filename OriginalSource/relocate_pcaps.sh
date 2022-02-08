#!/usr/bin/bash
for pathname in ./IoTSENTINEL_captures/*/*.pcap; do

	# create first stab at destination pathname
	dest="./pcaps/${pathname##*/}"

	i=0
	while [ -e "$dest" ]; do
		# destination name exists, remove backup number from end of pathname and replace with next one in the sequence
		i=$((i+1))
		dest="${dest%.~*~}.~$i~"
	done

	cp "$pathname" "$dest"
done
