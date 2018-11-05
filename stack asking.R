url<-'https://www.edsurge.com/product-reviews/mr-elmer-product/educator-reviews'

html<-read_html(url)

texts<-html%>%html_nodes('.grey-4')%>%html_text(trim = T)


url2<-'https://www.trustpilot.com/review/relymedia.com'
html2<-read_html(url2)
names<-html2%>%html_nodes('.consumer-info__details__name' )%>%html_text(trim = T)


name_extract<-function(url){
        html2<-read_html(url)
        names<-html2%>%html_nodes('.consumer-info__details__name' )%>%html_text(trim = T)
}


pages<-c(1:19)

for(i in 1:19){
        pages[i]<-paste0(url2,'?page=',i)
}

all_pages_names<-sapply(pages,name_extract)

all_pages_names<-unlist(all_pages_names)%>%data.frame()
