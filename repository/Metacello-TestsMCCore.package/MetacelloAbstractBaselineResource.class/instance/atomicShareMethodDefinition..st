AtomicX
atomicShareMethodDefinition: cat
  ^ self
    createMethodDefinitionFor: 'AtomicCoreX1'
    classIsMeta: true
    selector: 'atomicSharedMethod'
    category: cat
    source: (self sourceCodeAt: #'atomicSharedMethod')