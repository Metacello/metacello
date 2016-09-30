RecordX
setUpBaselineOfRecordX: recordXBaslineClassName packageRepo: packageRepo packageVersion: packageVersion loadType: loadType sourceForProjectClass: sourceForProjectClass
  "self reset"

  | className basePackageName definitionArray |
  className := basePackageName := recordXBaslineClassName.
  definitionArray := self
    definitionsForPostPreloadDoitBaseline: className
    loadType: loadType
    sourceForProjectClass: sourceForProjectClass.
  ^ self
    createPackage: basePackageName
    packageVersion: packageVersion
    in: packageRepo
    withDefinitions: definitionArray