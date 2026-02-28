#!/bin/bash
set -euo pipefail
system_detail () {
 echo "================== System Information ================="
 echo "Hostname       : $(uname -n)"
 echo "OS             : $(uname -o)"
 echo "Kernel Release : $(uname -r)"
 echo "Kernel Version : $(uname -v)"
}
uptime_details () {
 echo "================= System Uptime ======================"
 echo "System up since    : $(uptime -s)"
 echo "System up duration : $(uptime -p)"
}
disk_usage () {
 echo "============= Disk Usage for top 5 ==================="
 df -h | head -1 
 df -h | sort -hr -k5 | head -5
<<NOTE
df -h print whole info
sort -hr -k5 print human readable(h), reverse order(r), col 5 (k5)
NOTE
}
memory_usage () {
 echo "============= Memory Usage ==========================="
 free -h | awk 'NR==2 {print "Total memory: "$2, "\nFree memory: "$4, "\nUsed Memory: "$3}'
} 
cpu_using_process () {
 echo "============= List of top 5 CPU using Processes ====="
 ps -eo pid,ppid,user,comm,%cpu --sort=-%cpu | head -6
}

main () {
 system_detail
 uptime_details
 disk_usage
 memory_usage
 cpu_using_process
}
main
