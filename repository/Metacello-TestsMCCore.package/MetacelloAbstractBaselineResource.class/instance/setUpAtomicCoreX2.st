AtomicX
setUpAtomicCoreX2
  "self reset"

  | infoArray def1 def2 |
  def1 := self
    createMethodDefinitionFor: 'AtomicCoreX2'
    classIsMeta: true
    selector: 'atomicVersionInfo'
    category: '*atomic-corex-2'
    source: 'atomicVersionInfo ^''dkh-1'''.
  def2 := self
    createMethodDefinitionFor: 'AtomicCoreX2'
    classIsMeta: true
    selector: 'atomicVersionInfo'
    category: '*atomic-corex-2'
    source: 'atomicVersionInfo ^''dkh-2'''.
  infoArray := self
    setUpAtomicCoreX2: externalPackages
    extraDefs:
      {def1.
      (self atomicShareMethodDefinition: '*atomic-corex-2')}
    packageVersion: '-dkh.1'
    info: #().
  self
    setUpAtomicCoreX2: alternatePackages
    extraDefs: {def2}
    packageVersion: '-dkh.2'
    info: infoArray