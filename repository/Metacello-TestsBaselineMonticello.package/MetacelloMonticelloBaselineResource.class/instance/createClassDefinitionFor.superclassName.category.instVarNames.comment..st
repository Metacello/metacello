private
createClassDefinitionFor: className superclassName: superclassName category: basePackageName instVarNames: instVarNames comment: comment
  ^ MCClassDefinition
    name: className asSymbol
    superclassName: superclassName asSymbol
    category: basePackageName
    instVarNames: instVarNames
    comment: comment