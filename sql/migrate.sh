#!/bin/sh

DIR="sql"
if [ -d $DIR ]; then
    cd ./sql
fi

for file in `\find . -maxdepth 1 -type f | sort`; do
    if [ $file == './seed.sql' ]; then
        cat seed.sql
#        echo $file
    elif [ `echo $file | grep '\.sql'` ]; then
        echo $file
#        mysqldef seeft -u mysql -p pwd --skip-drop < $file
    fi
done
