#!/bin/bash

mt_log=/var/log/maintenance.log
mt_time=$(date '+%Y-%m-%d %H:%M:%S')
echo "=========$mt_time Maintenance Started========" >> $mt_log
log_f () {
	echo "======$mt_time Log Rotation Started======" >> $mt_log
	/home/yatin/scripts/log_rotate.sh /home/yatin/app-logs 2>&1 >> $mt_log
	echo "======$mt_time Log Rotation Completed======" >> $mt_log
}
back_f () {
	echo "=======$mt_time Backup Started======" >> $mt_log
	/home/yatin/scripts/backup.sh /tmp/source /tmp/backup 2>&1 >> $mt_log
	echo "=======$mt_time Backup Completed========" >> $mt_log
}
log_f
back_f
echo "========$mt_time Maintenance Completed======" >> $mt_log
