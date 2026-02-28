#!/bin/bash
log_path=$1
day=$(date '+%Y-%m-%d')
if [ $# = 0 ]; then
	echo "Please provide log file path"
	echo "Usage : $0 <path to log>, BYE BYE!"
	exit 1
   elif [ ! -f $log_path ]; then
	echo "Error : $log_path does not exists, BYE BYE !"
	exit 1
fi
#Function for Error or Failed messages
Error_Failed_Func () {
        ec=$(grep -i -E "ERROR|Failed" $log_path | wc -l)
        echo "Total number of Error or Failed lines in $log_path - $ec" >> /tmp/log_report_$day.txt
	echo "============Top 5 ERROR Messages with their occurence count===========" >> /tmp/log_report_$day.txt
	grep "ERROR" $log_path | awk '{$1=$2=$3="";print}' | sort | uniq -c | sort -rn | head -5 >> /tmp/log_report_$day.txt
}
#Function for Critical Errors
Critical_Func () {
        cc=$(grep -c "CRITICAL" $log_path) #Count Critical errors
        echo "Number of Critical Messages in $log_path - $cc" >> /tmp/log_report_$day.txt
	echo "==============List of CRITICAL Events with Line Numbers===============" >> /tmp/log_report_$day.txt
	grep -n "CRITICAL" $log_path |  sed 's/^\([0-9]*\):/Line \1:/' >> /tmp/log_report_$day.txt
}
#Function for summary report
main () {
	echo "Date of Analysis -  $day" >> /tmp/log_report_$day.txt
	echo "Log File Name    - $log_path" >> /tmp/log_report_$day.txt
	echo "Total Lines Processed - $(wc -l $log_path)" >> /tmp/log_report_$day.txt
	Error_Failed_Func
	Critical_Func
	echo "Log File Summary Report Generated Successfully" >> /tmp/log_report_$day.txt
}
main
if [ ! -d /tmp/archive ]; then
	mkdir /tmp/archive
fi
mv $log_path /tmp/archive/
echo "Log File Archived at /tmp/archive successfully" >> /tmp/log_report_$day.txt
