url<-'https://www.otlob.com/restaurants'
html<-read_html(url)
names<-html%>%html_nodes(xpath = '//span[@class="vendor__name"]')%>%html_text(trim = T)

bestfood<-html%>%html_nodes(xpath = '//ul[@class="vendor__cuisines"]')%>%html_text(trim = T)

delivery_time<-html%>%html_nodes(xpath = '//span[@class="minutes"]')%>%html_text(trim = T)


seq<-3*c(1:30)

delivery_fee<-html%>%html_nodes(xpath = '//span[@class="price-tooltip__price"]')%>%html_text(trim = T)%>%(function(x){
        delivery_fee[c(seq)]
})



rate<-html%>%html_nodes(xpath = '/html/body/div/div/main/div/div/div/form/div/section/section/article/a/div/div/div/div/div/span[1]')%>%html_text()

rev_num<-html%>%html_nodes(xpath = '/html/body/div/div/main/div/div/div/form/div/section/section/article/a/div/div/div/div/div/span/span')%>%html_text()


all_data<-rbind(names,bestfood,delivery_fee,delivery_time,rate,rev_num)
all_data<-t(all_data)


all_process<-function(url){
        url<-url
        html<-read_html(url)
        names<-html%>%html_nodes(xpath = '//span[@class="vendor__name"]')%>%html_text(trim = T)
        bestfood<-html%>%html_nodes(xpath = '//ul[@class="vendor__cuisines"]')%>%html_text(trim = T)
        delivery_time<-html%>%html_nodes(xpath = '//span[@class="minutes"]')%>%html_text(trim = T)
        delivery_fee<-html%>%html_nodes(xpath = '/html/body/div/div/main/div/div/div/form/div/section/section/article/a/div/div/div/div/ul/li/span[1]')%>%html_text(trim = T)
        seqq<-3*c(1:30)
        delivery_fee<-delivery_fee[c(seqq)]
        rate<-html%>%html_nodes(xpath = '/html/body/div/div/main/div/div/div/form/div/section/section/article/a/div/div/div/div/div/span[1]')%>%html_text()
        rev_num<-html%>%html_nodes(xpath = '/html/body/div/div/main/div/div/div/form/div/section/section/article/a/div/div/div/div/div/span/span')%>%html_text()
        all_data<-rbind(names,bestfood,delivery_fee,delivery_time,rate,rev_num)
        all_data<-t(all_data)
        print(data.frame(all_data))
}

pages<-c(1:60)
for(i in seq_along(pages)){
        pages[i]<-paste('https://www.otlob.com/restaurants','?page=',pages[i],sep = '')
}


all_data<-sapply(pages,all_process)

all_data2<-bind_rows(all_data)


unique(all_data2$names)

writeWorksheetToFile(file = './data sets/otlob.xlsx',data = all_data2,sheet = 'otlob')

##################################
url<-'https://www.otlob.com/restaurants'
cast<-read_html(url)%>%html_nodes('.vendor__name')%>%html_text(trim = T)


s<-html_session(url = url)

new<-list()
for(i in cast[1:30]){
        pages<-s%>%follow_link(i)%>%read_html()
        new[[i]]<-pages%>%html_nodes('.menu-item__variation__price , .menu-item__title')%>%html_text(trim = T)
}
###################################################################
##by RSelenium

rD<-rsDriver(browser = 'firefox')
RemDr<-rD$client
RemDr$setImplicitWaitTimeout(10000)
RemDr$navigate('https://www.otlob.com/restaurants')

load<-function(){
        body0<-NULL
        while(is.null(body0)){
                body0<-RemDr$findElement(using ='xpath',value = '/html/body' )
                body0$sendKeysToElement(list(key='end'))
        }
}


repeat {
        startTime <- Sys.time()
        load()
        sleepTime <- startTime + 2 - Sys.time()
        if (sleepTime > 0)
                Sys.sleep(sleepTime)
}


res_name<-RemDr$findElements(using = 'css',value = 'html.desktop.js body.whitelabel.whitelabel-on-main-domain.no-foodpanda.eg div.page-wrapper.js-sticky-height-calculate-container div.content-wrapper main.js-sticky-height-calculate-container div.container div.vendors div.vendors__inner.js-sticky-height-calculate-container form.js-vendor-list-form div.row section.vendor-list.js-infscroll-container section.js-infscroll-load-more-here article.vendor.list.js-vendor-list-vendor-panel a.vendor__inner.js-fire-click-tracking-event div.vendor__details div.vendor__title span.vendor__name')

res_names<-list()
res_names<-c(unlist(sapply(res_name,function(x){
        x$getElementText()
})))
