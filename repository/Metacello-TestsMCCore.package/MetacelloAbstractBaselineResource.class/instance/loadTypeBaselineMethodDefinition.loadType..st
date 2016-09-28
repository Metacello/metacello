AtomicX
loadTypeBaselineMethodDefinition: baselineClassName loadType: loadType
  ^ self
    createMethodDefinitionFor: baselineClassName
    classIsMeta: false
    selector: 'loadType'
    category: 'cat'
    source: 'loadType ^' , loadType printString