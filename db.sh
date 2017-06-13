#MySQL
# size of databases in tablespace
mysql -uroot -prootpassword -e'SELECT table_schema "database_name", sum( data_length + index_length )/1024/1024 "Data Base Size in MB" FROM information_schema.TABLES GROUP BY table_schema;'

# it's not a secret, that size of database not equal size of dump file.
# how to calculate real size of SQL-dump without actually write on disk and check? (shows size in bytes)
mysqldump -uroot -prootpassword database_name | gzip | zcat | wc -c
