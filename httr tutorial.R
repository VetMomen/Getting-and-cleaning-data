a<-GET('https://www.otlob.com/')

status_code(a)

headers(a)

content(a)%>%str()
#######################################################

r<-GET("http://httpbin.org/get")
http_status(r)
warn_for_status(r)
stop_for_status(r)

content(r, "text", encoding = "ISO-8859-1")

content(r,'raw')

bin<-content(r,'raw')
writeBin(bin,'./data sets/myfile.txt')

?content
content(r)

headers(r)
