#creating data.table object 

DT<-data.table(V1=c(1L,2L),
               V2=LETTERS[1:3],
               V3=round(rnorm(4),4),
               V4=1:12)
#subsetting rows by numbers

DT[3:5,]
#Or
DT[3:5]

#select rows with certain value 

DT[V2=='A']

DT[V2%in%c('A','C')]

#selecting columns and several columns 

DT[,V2]

DT[,.(V2,V3)]

#Computing

DT[,.(sum(V3),sd(V1))]

DT[,.(sum=sum(V3),sd=sd(V1))]

#recycling value
DT[,.(V1,sum(V3))]

#Multible expresion 

DT[,{print(V2)
        plot(V3)
        NULL}]

#Doing J by group

DT[,.(V4.sum=sum(V4)),by=V1]

#Doing J by several group

DT[,.(V4.sum=sum(V4)),by=.(V1,V2)]

#Doing J by function

DT[,.(V4.sum=sum(V3)),by=.(V1=sign(V1-1))]

#grouping subset by specifying i rows

DT[2:5,.(sum=sum(V3)),by=V1]

#using .N

DT[,.N,by=V1]

#Adding & modifying columns

DT[,V1:=round(exp(V1),2)]

DT[,c('V1','V2'):=list(
        round(exp(V1),2),
        LETTERS[4:6]
)][]

DT[,':='(
        V1=round(exp(V1),2),
        V2=LETTERS[4:6]
)][]

#removing column

DT[,V1:=NULL][]

DT[,c('V1','V2'):=NULL]

cols.chosen<-c('V1','V2')

DT[,(cols.chosen):=NULL][]
#setting and Keys

setkey(DT,V2)
DT['A']
DT[c('A','C')]
DT['A',mult='first']
DT['A',mult='last']

DT[c('A','B'),nomatch=NA]

DT[c('A','B'),sum(V3),by=.EACHI]

setkey(DT,V1,V2)
DT[.(2,'C')]
DT[.(2,c('A','B'))]
