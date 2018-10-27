#reading XML file 

data<-xmlParse(file = './data sets/Test.xml')

print(data)

# Exract the root node form the xml file.

top<-xmlRoot(data)

# Find number of nodes in the root.

rootsize<-xmlSize(top)

#Details of the First Node

top[1]

#Get Different Elements of a Node

top[[1]][[1]]

#XML to Data Frame

xml_df<-xmlToDataFrame('./data sets/Test.xml')
##########################################################################3
#Another Tutoroal#
##################

#to Know the name of XML Data
XML::xmlName(top)

#to Know the namespace of XML Data

xmlNamespace(top)

#kmowing and getting certain attribut
xmlAttrs(top)
xmlGetAttr(top)

ID<-top[[1]][['NAME']]

nodes<-getNodeSet(top,'/RECORDS//EMPLOYEE')
sapply(nodes, function(x) xmlSApply(x, xmlValue))
xmlSApply(nodes,function(x){xmlSApply(x,xmlValue)})

xpathSApply(top,'/RECORDS//EMPLOYEE',xmlValue)
