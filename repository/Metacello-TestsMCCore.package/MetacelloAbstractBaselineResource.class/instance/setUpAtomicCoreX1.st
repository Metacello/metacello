AtomicX
setUpAtomicCoreX1
  "self reset"

  | infoArray def1 def2 |
  def1 := self
    createMethodDefinitionFor: 'AtomicCoreX1'
    classIsMeta: true
    selector: 'atomicVersionInfo'
    category: '*atomic-corex-1'
    source: 'atomicVersionInfo ^''dkh-1'''.
  def2 := self
    createMethodDefinitionFor: 'AtomicCoreX1'
    classIsMeta: true
    selector: 'atomicVersionInfo'
    category: '*atomic-corex-1'
    source: 'atomicVersionInfo ^''dkh-2'''.
  infoArray := self
    setUpAtomicCoreX1: externalPackages
    extraDefs:
      {def1.
      (self atomicShareMethodDefinition: '*atomic-corex-1')}
    packageVersion: '-dkh.1'
    info: #().
  self
    setUpAtomicCoreX1: alternatePackages
    extraDefs: {def2}
    packageVersion: '-dkh.2'
    info: infoArray