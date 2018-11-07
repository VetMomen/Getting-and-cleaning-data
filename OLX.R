olx_url<-list()

for(i in 1:500){
        olx_url[i]<-paste0('https://olx.com.eg/properties/properties-for-sale/?page=',i)
}


titles<-list()
titles<-sapply(olx_url,function(url){
        read_html(url)%>%html_nodes( css =  '.ads__item__title')%>%
                html_text(trim = T)
})

titles<-c(unlist(titles))
writeWorksheetToFile(file = './data sets/titles.xlsx',data = titles,sheet = 'titles')
