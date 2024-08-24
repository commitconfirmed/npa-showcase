#!/bin/bash

iperf3 -c 172.16.1.1 -B 172.16.10.2 -p 5000 -b 1M -t 300s --logfile iperf-5000-stats.txt &
iperf3 -c 172.16.1.1 -B 172.16.10.2 -p 5001 -b 1M -t 300s --logfile iperf-5001-stats.txt &
iperf3 -c 172.16.1.1 -B 172.16.10.2 -p 5002 -b 1M -t 300s --logfile iperf-5002-stats.txt &
iperf3 -c 172.16.1.1 -B 172.16.10.2 -p 5003 -b 1M -t 300s --logfile iperf-5003-stats.txt &
iperf3 -c 172.16.1.1 -B 172.16.10.2 -p 5004 -b 1M -t 300s --logfile iperf-5004-stats.txt &
iperf3 -c 172.16.1.1 -B 172.16.10.2 -p 5005 -b 1M -t 300s --logfile iperf-5005-stats.txt &
iperf3 -c 172.16.1.1 -B 172.16.10.2 -p 5006 -b 1M -t 300s --logfile iperf-5006-stats.txt &
iperf3 -c 172.16.1.1 -B 172.16.10.2 -p 5007 -b 1M -t 300s --logfile iperf-5007-stats.txt &
iperf3 -c 172.16.1.1 -B 172.16.10.2 -p 5008 -b 1M -t 300s --logfile iperf-5008-stats.txt &
iperf3 -c 172.16.1.1 -B 172.16.10.2 -p 5009 -b 1M -t 300s --logfile iperf-5009-stats.txt &