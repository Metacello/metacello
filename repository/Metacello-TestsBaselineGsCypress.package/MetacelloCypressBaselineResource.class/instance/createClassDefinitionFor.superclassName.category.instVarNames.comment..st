private
createClassDefinitionFor: className superclassName: superclassName category: basePackageName instVarNames: instVarNames comment: comment
  ^ CypressClassDefinition
    name: className
    superclassName: superclassName
    category: basePackageName 
    instVarNames: instanceVarNames
    classInstVarNames: #() 
    classVarNames: #() 
    poolDictionaryNames: #() 
    comment: comment 
    subclassType: '' 
