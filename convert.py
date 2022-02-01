#!/usr/bin/env
import os
import pyshark

os.system("find ./IoTSENTINEL_captures -maxdepth 2 -name *.pcap | xargs mergecap -w IoTSentinel.pcap")

os.system("tshark -r IoTSentinel.pcap -T fields -e ip.src -e frame.len -e ip.proto -E separator=, -E occurrence=f > traffic.csv")
