download.file(url = 'https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD',destfile = './data sets/Restaurants.csv')
rest<-read.csv(file = './data sets/Restaurants.csv')
head(rest)

quantile(x = rest$councilDistrict)

table(rest$zipCode,useNA = 'ifany')

table(rest$zipCode,rest$councilDistrict)

table(rest$zipCode==c('21212','21213'))

data("esoph")

head(esoph)

ftable(xtabs(data = esoph,ncontrols~.))

xtabs(data = esoph,ncontrols~agegpa+alcgp)
table(esoph$agegp,esoph$alcgp)

head(rest)
xtabs(data = rest,councilDistrict~policeDistrict+neighborhood)

