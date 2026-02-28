#!/bin/bash
#variable defination
log_path=$1
timestamp=$(date '+%Y-%m-%d-%H-%M-%S')

#Check if argument passed or not else check if path exists or not
if [ $# -eq 0 ]; then
  echo 'Usage : ./log_rotate.sh <path for log file>, BYE BYE!'
  exit 1 
 elif [ ! -d "$1" ]; then
  echo "Log directory $1  does not exists, BYE BYE!"
  exit 1
fi

#Function to List file in the path before taking any action
list_file(){
 echo "====== $timestamp ======" >> /${log_path}/log_list.txt
 ls -lt "${log_path}" >> /${log_path}/log_list.txt
}
list_file

#Function to List and gzip log file older than 7 days
zip_log_7day() {
 echo "====== $timestamp =====" >> /${log_path}/log_file_old_7day.txt
 #compress=$(find "$log_path" -name "*.log" -mtime +7 | wc -l)
 #find "$log_path" -name "*.log" -mtime +7 -exec gzip {} \; -print >> /${log_path}/log_file_old_7day.txt
 #echo "Number of Compressed files - $compress" 
 compress=$(find $log_path -type f -name "*.log" -mtime +7 -print -exec gzip {} \; | tee -a "$log_path/log_file_old_7day.txt" | wc -l); echo "Number of Compressed Files - $compress"
}
zip_log_7day

#Function to List and Delete .gz file older than 30 days
delete_gz_30day() {
 echo "====== $timestamp =====" >> /${log_path}/gz_file_old_30day.txt
 delete=$(find "$log_path" -name "*.gz" -mtime +30 | wc -l)
 find $log_path -name "*.gz" -mtime +30 -delete -print >> /${log_path}/gz_file_old_30day.txt
 echo "Number of .gz files deleted - $delete"
}
delete_gz_30day
