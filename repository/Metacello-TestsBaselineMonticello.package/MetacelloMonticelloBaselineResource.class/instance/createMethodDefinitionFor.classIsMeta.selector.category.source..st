private
createMethodDefinitionFor: className classIsMeta: isMeta selector: selector category: cat source: source
  ^ MCMethodDefinition
    className: className asString
    classIsMeta: isMeta
    selector: selector
    category: cat
    timeStamp: ''
    source: source