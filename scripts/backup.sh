#!/bin/bash
#Exists if arguments does not exists
set -euo pipefail
source_path=$1
dest_path=$2
timestamp=$(date '+%Y-%m-%d-%H-%M-%S')   #Format YYYY-MM-DD-HH-MM-SS

#Function to take backup
backup(){
  tar -czf "${dest_path}/backup-${timestamp}.tar.gz" "${source_path}" > /dev/null
  if [ $? -eq 0 ]; then
     echo "Backup Created Successfully at $timestamp"
     echo "List of Backups Taken Till Now"
     du -h "$dest_path"/*.tar.gz
  else
     echo "Backup Creation failed"
     exit 1
  fi
}
backup #Backup Function called to take backup

#Function to List and Delete .tar.gz file older than 14 days
cleanup () {
 echo "====== $timestamp =====" >> /${dest_path}/cleanup-backup.txt
 delete=$(find $dest_path -name "*.tar.gz" -mtime +14 | wc -l)
 find $dest_path -name "*.tar.gz" -mtime +14 -delete -print >> /${dest_path}/cleanup-backup.txt
 echo "Number of 14 days older backup deleted - $delete"
 if [ $delete != 0 ]; then
  echo "Here is the list of file deleted"
  tail -$delete /${dest_path}/cleanup-backup.txt
 else
  exit 1
 fi 
}
cleanup #Cleanup function called
