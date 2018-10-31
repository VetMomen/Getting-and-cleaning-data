#open connection with mysql server

mysql_con<-dbConnect(
        MySQL(),
        user='genome',
        host='genome-mysql.soe.ucsc.edu'
)

#SUMMARY

summary(mysql_con)

#getting dbs & closing it 

dbs<-dbGetQuery(mysql_con,'show databases')
dbDisconnect(mysql_con)

#connect to certain database 

mydb<-dbConnect(MySQL(),
                user='genome',
                host='genome-mysql.soe.ucsc.edu',
                db='hg19')

#getting all tables in a certain database

all_tables<-dbListTables(mydb)
length(all_tables)

all_tables[1:5]

#getting cerain feild from database 
fields<-dbListFields(mydb,"HInvGeneMrna")

#reading tables

genes<-dbReadTable(mydb,"mgcGenes")

#getting certain Qeuery

dbGetQuery(mydb,'SELECT 20 FROM mgcGenes WHERE exonCount>20')

#sending Query

send<-dbSendQuery(mydb,'SELECT name2 FROM mgcGenes WHERE exonCount > 20')
dbFetch(send)

dbClearResult(send)

#closing the connection

dbDisconnect(mydb)
