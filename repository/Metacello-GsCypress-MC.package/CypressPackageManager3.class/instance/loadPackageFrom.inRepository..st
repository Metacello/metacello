loading
loadPackageFrom: aPackage inRepository: aRepository

  ^ self 
    loadPackageFrom: aPackage 
    defaultSymbolDictionaryName: self defaultSymbolDictionaryName 
    inRepository: aRepository
