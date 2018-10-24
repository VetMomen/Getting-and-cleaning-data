# writing sheet 

data('ChickWeight')

require(XLConnect)

#Writing sheet 

wd<-loadWorkbook(filename = 'Example1.xlsx',create = T)

createSheet(object = wd,name = 'chicksheet')

writeWorksheet(object = wd,
               data = ChickWeight,
               sheet = 'chicksheet',
               startRow = 3,
               startCol = 3)

saveWorkbook(object = wd,file = './data sets/XLConnectExample1.xlsx')


#writing sheet with one call

writeWorksheetToFile(file = './data sets/XLConnectExample2.xlsx',data = chickwts,sheet = 'chickweight')


#writing name region 

data('women')

wb<-loadWorkbook(filename = 'Example3.xlsx',create = T)
createSheet(object = wb,name = 'WomenData')
createName(object = wb,name = 'WomenName',formula = 'WomenData!$c$5',overwrite = T)
writeNamedRegion(object = wb,data = women,name = 'WomenName')
saveWorkbook(object = wb,file = './data sets/women_Example3.xlsx')
