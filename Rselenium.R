install.packages('webdriver')
library('webdriver')
install_phantomjs()

rD<-rsDriver()
library(wdman)

binman::rm_platform("phantomjs")
wdman::selenium(retcommand = TRUE)
rD$close()
