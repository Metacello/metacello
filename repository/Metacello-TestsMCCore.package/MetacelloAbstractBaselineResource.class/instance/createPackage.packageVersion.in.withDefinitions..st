private
createPackage: packageName packageVersion: packageVersion in: aRepository withDefinitions: definitionArray
  ^ self
    createPackage: packageName
    packageVersion: packageVersion
    in: aRepository
    withDefinitions: definitionArray
    info: #()