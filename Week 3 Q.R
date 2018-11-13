download.file(url = 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv',destfile = './data sets/housing.csv')
download.file(url = 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf',destfile = './data sets/housing.pdf')

housing<-read_csv(file = './data sets/housing.csv')

names(housing)


#Building New Vector
##by classical way :

housing$agricultureLogical<-housing$ACR==3&housing$AGS==6
        
which(housing$agricultureLogical)

##By tidyverse

housing<-housing%>%mutate(agricultureLogical=housing$ACR==3&housing$AGS==6)
which(housing$agricultureLogical)
##################################################################
download.file(url = 'https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg',
              destfile = './data sets/image.jpeg')

jpeg <-readJPEG(source = './data sets/image.jpeg',native = T)
quantile(jpeg,probs = c(.30,.80))
###################################################################

download.file(url = 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv',
              destfile = './data sets/prod.csv')

download.file(url = 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv',
              destfile = './data sets/edu.csv')

edu<-read_csv('./data sets/edu.csv')
prod<-read_csv('./data sets/prod.csv')
####################################################################

names(edu)
names(prod)
head(edu)
head(prod)
?match
edu$CountryCode%in%prod$X1%>%sum()
?join

all<-edu%>%inner_join(prod,by = c('CountryCode' ='X1'))%>%arrange(desc(`Gross domestic product 2012`))
all%>%slice(13)
all<-all%>%mutate(`Gross domestic product 2012`=as.numeric(`Gross domestic product 2012`))
all%>%filter(`Income Group`==c('High income: nonOECD','High income: OECD'))%>%
        mutate(`Gross domestic product 2012`=as.numeric(`Gross domestic product 2012`))%>%
        group_by(`Income Group`)%>%summarize(mean=mean(`Gross domestic product 2012`,na.rm = T))

######################################################################

all$cuts<-cut(all$`Gross domestic product 2012`,breaks = quantile(all$`Gross domestic product 2012`,probs = c(.2,.4,.6,.8,1),na.rm = T))
xtab<-xtabs(data = all,`Gross domestic product 2012`~cuts+CountryCode)
xtab%>%ftable()%>%View
