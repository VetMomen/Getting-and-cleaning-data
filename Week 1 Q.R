download.file(url = 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv',
                      destfile = './data sets/survey.csv')
survey<-fread('./data sets/survey.csv')

dim(survey)

#getting value more than 1000000
survey[,.N,by=VAL][VAL>=24]

download.file(url = 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx',
              destfile = './data sets/Gas.xlsx')

ob<-loadWorkbook(filename = './data sets/Gas.xlsx')

xml<-xmlTreeParse(file = 'http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml',isURL = T,useInternalNodes = T)
top<-xmlRoot(xml)

top2<-getNodeSet(doc = top,path = '/response//row//row')

xmldat<-xmlSApply(top2,function(x){xmlSApply(x,xmlValue)})

dim(xmldat)


xmldat<-t(xmldat)

dim(xmldat)

xmldat<-data.table(xmldat)

xmldat<-xmldat[,-'location_1']

xmldat[zipcode==21231][,.N,by='zipcode']


download.file(url = 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv',destfile = './data sets/survey2.csv')

survey2<-fread('./data sets/survey2.csv')

dim(survey2)

survey2[,.(MEAN=mean(pwgtp15)),by=SEX]

survey[,.(mean=mean(TYPE),
          count=.N,
          sum=sum(TYPE)),by=.(VAL,BDS)]
