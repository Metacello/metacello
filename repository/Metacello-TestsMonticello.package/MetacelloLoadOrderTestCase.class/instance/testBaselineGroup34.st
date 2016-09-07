testing
testBaselineGroup34
  | version project loadedPackages |
  project := self class new project.
  version := project version: '3.4-baseline'.
  loadedPackages := version spec packageSpecsInLoadOrder asArray
    collect: [ :each | each name ].
  self assert: (loadedPackages indexOf: 'Example-Core') > 0.
  self
    assert:
      (loadedPackages indexOf: 'Example-GemStone300-Core')
        > (loadedPackages indexOf: 'Example-Core').
  self
    assert:
      (loadedPackages indexOf: 'Example-GemStone-Core')
        > (loadedPackages indexOf: 'Example-GemStone300-Core').
  self
    assert:
      (loadedPackages indexOf: 'Example-3')
        > (loadedPackages indexOf: 'Example-GemStone-Core').
  self
    assert:
      (loadedPackages indexOf: 'Example-2')
        > (loadedPackages indexOf: 'Example-GemStone-Core').
  self
    assert:
      (loadedPackages indexOf: 'Example-1')
        > (loadedPackages indexOf: 'Example-GemStone-Core')