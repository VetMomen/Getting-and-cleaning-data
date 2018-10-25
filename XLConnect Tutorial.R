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


#writing named region 

data('women')

wb<-loadWorkbook(filename = 'Example3.xlsx',create = T)
createSheet(object = wb,name = 'WomenData')
createName(object = wb,name = 'WomenName',formula = 'WomenData!$c$5',overwrite = T)
writeNamedRegion(object = wb,data = women,name = 'WomenName')
saveWorkbook(object = wb,file = './data sets/women_Example3.xlsx')


#writing named region with one call

writeNamedRegionToFile(file = './data sets/WomenExample4.xlsx',data = women,name = 'WomenNamed',formula = 'WomenData!$c$5')

#Reading Excel files: basic functions
##readWorksheet() - reading worksheets of an Excel workbook

data<-readWorksheet(object = wd,sheet = 'chicksheet',startRow = 3,startCol = 3,endRow = 581,endCol = 6)

##Example: reading from an Excel sheet with one call

readWorksheetFromFile(file = './data sets/XLConnectExample1.xlsx',sheet='chicksheet',startRow = 3,startCol = 3,endRow = 581,endCol = 6)

#Example: reading from an Excel named region

readNamedRegion(object = wb,name = 'WomenName')

#Example: reading from an Excel named region with one call

readNamedRegionFromFile(file = './data sets/Women_Example3.xlsx',name='WomenName')

#Advanced Usage and Examples

require(XLConnect)
require(zoo)
require(ggplot2) # >= 0.9.3

curr <- XLConnect::swissfranc
curr<-curr[order(curr$Date),]

##workbook file name

wbFileName<-"swiss_franc.xlsx"

##Creat new workbook

wb<-loadWorkbook(filename = wbFileName,create = T)

##Creat new sheet 

sheet<-'Swiss_Franc'

##creat sheet

createSheet(object = wb,name = sheet)

##creating name
name<-'currency'
formula<-paste(sheet,'$A$1',sep = '!')
createName(object = wb,name = name,formula = formula)

## Instruct XLConnect to only apply a data format for a cell
## but not to apply any other cell styling
setStyleAction(wb,XLC$STYLE_ACTION.DATA_FORMAT_ONLY)

##Set the default format for numeric data to display
## four digits after the decimal point

setDataFormatForType(object = wb,type = XLC$DATA_TYPE.NUMERIC,format = '0.000')

## Write the currency data to the named region created above
## Note: the named region will be automatically redefined to encompass all
##written data

writeNamedRegion(object = wb,data = curr,name = name)

# Save the workbook (this actually writes the file to disk)

saveWorkbook(object = wb,file = paste('./data sets',wbFileName,sep = '/'))
