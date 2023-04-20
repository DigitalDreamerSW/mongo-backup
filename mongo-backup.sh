#! /bin/bash
backup_dir=/var/backup
file_name="mongobackup_`date +%Y-%m-%d`"
log=$backup_dir/mongobackup_log_`date +%Y-%m-%d`
number_of_backups=1
#robi kopie
echo "---`date +%Y-%m-%d" ""["%H:%M:%S"]"`---" > $log
mongodump --out $backup_dir/$file_name &>> $log
if [ $? -eq 0 ] ; then
echo "Kopia wykonana z sukcesem " >> $log
else
echo "Błąd wykonywania kopii !" >> $log
fi
#usuwa stare kopie
find $backup_dir -name "mongobackup*" -mtime +$number_of_backups -exec rm -rfv {} \; &>> $log