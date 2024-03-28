import mysql.connector
connection =mysql.connector.connect(host='localhost',
                                    port='3306',
                                    user='root',
                                    password='your passwords')
cursor = connection.cursor()

#create a database
cursor.execute("create database `your database name`;")
#show all databases
cursor.execute("show databases")
records=cursor.fetchall()
for r in records:
    print(r)
#select database
cursor.execute("use `your database name`;")
#create table
cursor.execute("create table `your table name`(something int);")
#when you finish work, close mysql and connection.
cursor.close()
connection.close()


import mysql.connector
connection =mysql.connector.connect(host='localhost',
                                    port='3306',
                                    user='root',
                                    password='your password',
                                    database='your database')
cursor = connection.cursor()
#show all infor from branch
cursor.execute('select * from `branch`;')
records = cursor.fetchall()
for r in records:
    print(r)
cursor.close()
connection.close()

#add new
cursor.execute("insert into `branch` values(5,'who',null);")
cursor.close()
#modify
cursor.execute('update `branch` set `manager_id`=null where `branch_id`=4;')
cursor.close()
#delete
cursor.execute('delete from `branch` where `branch_id`=5;')
cursor.close()

connection.commit()
connection.close()