#storing the URL

file_url<-'https://datatables.net'

#processing url

file_url<-RCurl::getURI(file_url)

#getting the xml file 

doc<-htmlTreeParse(file = file_url,useInternalNodes = T)

#Rooting

doc_root<-xmlRoot(doc)

#Extracting table element

table<-getNodeSet(doc = doc_root,path = '//table')

#Extracting Xpath of data

data<-table[[1]][['tbody']]

#converting it to dataframe

df<-xmlToDataFrame(data)

#naming the variables

names(df)<-c('name','position','office','age','start date','salary')

