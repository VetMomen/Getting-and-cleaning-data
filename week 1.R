### downloading data 

#file doanload url
dataurl<- 'https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD'

#setting direction
dir.create('data sets')

#getting documentation of download.file()
?download.file

#downloading the file 
download.file(url = dataurl,destfile = 'C:/Users/salsa/Documents/Getting-and-cleaning-data/data sets/camera.csv')

list.files('./data sets')

dateDownload<-date()
write_file(dateDownload,path = './data sets/camera_dateofdownload.txt')

install.packages('xlsx')


### Reading XML file 
#Note : there is a problem with the online file , so i will copy it and paste in local file 

dataxml<-xmlParse(file = './data sets/xml.xml')
rootnode<-xmlRoot(dataxml)
names(rootnode)

rootnode[[1]]

rootnode[[1]][[1]]

xmlSApply(rootnode,xmlValue)
