#!/bin/bash

until mysql -u root -h $DBHOST -P $DBPORT -e "SELECT 1"
do
  echo "Waiting for $DBHOST:$DBPORT to start ..."
  sleep 5
done

# Run scripts

cd $StarRocks_home/sql

for FILE in *; do 
  echo "Running $FILE on $DBHOST:$DBPORT ..."
  mysql -uroot -h $DBHOST -P $DBPORT < $FILE
done

echo "DONE!"