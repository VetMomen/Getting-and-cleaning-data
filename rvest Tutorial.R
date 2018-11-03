
#knowing the number of pages manually :

url<-'https://www.trustpilot.com/review/relymedia.com'
urllist<-1:19
for(i in 1:19){
        urllist[i]<-paste('https://www.trustpilot.com/review/relymedia.com?page=',i,sep = '') 
}
urllist

#getting the number of pages functionally :

get_last_page<-function(html){
        pages_data<-html%>%
                html_nodes('.pagination-page')%>%
                html_text()
        pages_data[length(pages_data)-1]%>%
                unname()%>%
                as.numeric()
}

first_page<-read_html('https://www.trustpilot.com/review/relymedia.com')
last<-get_last_page(first_page)

#list of all pages

list_pages<-str_c(url,'?pages=',1:last)

#Extract review

html<-read_html(url)

get_review<-function(html){
        nodes<-html_nodes(html,xpath = '//*[@class="review-info__body__text"]')%>%
                html_text()%>%
                str_trim()%>%
                unlist()
}



review<-get_review(html = html)

review%>%View


#Extract time 

get_time<-function(html){
        nodes<-html_nodes(html,xpath = '//*[@class="ndate"]')%>%
                html_text(trim = T)
}
time<-get_time(html)
?html_attrs
