AtomicX
setUpAtomicCoreX3
  "self reset"

  | infoArray def1 def2 |
  def1 := self
    createMethodDefinitionFor: 'AtomicCoreX3'
    classIsMeta: true
    selector: 'atomicVersionInfo'
    category: 'cat'
    source: 'atomicVersionInfo ^''dkh-1'''.
  infoArray := self
    setUpAtomicCoreX3: externalPackages
    extraDefs: {def1}
    packageVersion: '-dkh.1'
    info: #().
  def2 := self
    createMethodDefinitionFor: 'AtomicCoreX3'
    classIsMeta: true
    selector: 'atomicVersionInfo'
    category: 'cat'
    source: 'atomicVersionInfo ^''dkh-2'''.
  self
    setUpAtomicCoreX3: alternatePackages
    extraDefs: {def2}
    packageVersion: '-dkh.2'
    info: infoArray