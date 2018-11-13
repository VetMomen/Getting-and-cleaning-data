rD<-rsDriver(browser = 'firefox')
remDr<-rD$client

links<-list(1:100)
for(i in 2:100){
        links[i]<-paste0('https://www.indeed.com/jobs?q=Data+Science&l=United+States&start=',(i-1)*10)
}
links[1]<-'https://www.indeed.com/q-Data-Science-l-United-States-jobs.html'

REV<-function(url){
        remDr$navigate(url)
        
        top<-remDr$findElements(using = 'css',value = '.clickcard')
        top2<-sapply(top,function(x){
                tryCatch(x$findChildElement('css','.slNoUnderline'),error=function(err){NA})
        })
        
        top3<-sapply(top2,function(x){
                tryCatch(x$getElementText(),error=function(err){NA})
        })
}

Reviews<-sapply(links,REV)%>%unlist()
##############################################################3
TIT<-function(url){
        remDr$navigate(url)
        
        top<-remDr$findElements(using = 'css',value = '.jobtitle')
        top2<-sapply(top,function(x){
                tryCatch(x$getElementText(),error=function(err){NA})
        })
}

Titles<-sapply(links,TIT)%>%unlist
############################################################
co<-function(url){
        remDr$navigate(url)
        
        top<-remDr$findElements(using = 'css',value = '.company')
        top2<-sapply(top,function(x){
                tryCatch(x$getElementText(),error=function(err){NA})
        })
}

Company<-sapply(links,co)%>%unlist

##########################################################
loc<-function(url){
        remDr$navigate(url)
        
        top<-remDr$findElements(using = 'css',value = '.location')
        top2<-sapply(top,function(x){
                tryCatch(x$getElementText(),error=function(err){NA})
        })
}

Location<-sapply(links,loc)%>%unlist

############################################################3
date<-function(url){
        remDr$navigate(url)
        
        top<-remDr$findElements(using = 'css',value = '.date')
        top2<-sapply(top,function(x){
                tryCatch(x$getElementText(),error=function(err){NA})
        })
}

Date<-sapply(links,date)%>%unlist
#############################################################

All_data<-data.frame(Titles,Company,Reviews,Location,Date)

#############################################################
TIT_links<-function(url){
        remDr$navigate(url)
        
        top<-remDr$findElements(using = 'xpath',value = '/html/body/table/tbody/tr/td/table/tbody/tr/td/div/h2/a')
        top2<-sapply(top,function(x){
                x$getElementAttribute('href')
        })
}

TIT_Links<-sapply(links,TIT_links)%>%unlist()


#####################################################3

