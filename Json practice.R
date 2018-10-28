
#converting df to json and reverse it

mtcarJ<-toJSON(mtcars,pretty = T)

mtcar<-fromJSON(mtcarJ)

#######################################

