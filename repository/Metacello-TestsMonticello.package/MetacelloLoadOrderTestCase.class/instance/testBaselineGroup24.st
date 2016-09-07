testing
testBaselineGroup24
  | project version loadedPackages |
  project := self class new project.
  version := project version: '2.4-baseline'.
  loadedPackages := version spec packageSpecsInLoadOrder asArray
    collect: [ :each | each name ].
  self assert: (loadedPackages indexOf: 'Example-Core') > 0.
  self
    assert:
        (loadedPackages indexOf: 'Example-Core') > (loadedPackages indexOf: 'Project1');
    assert:
        (loadedPackages indexOf: 'Example-Core') > (loadedPackages indexOf: 'Project2');
    assert:
        (loadedPackages indexOf: 'Example-Core') > (loadedPackages indexOf: 'Project3');
    assert:
        (loadedPackages indexOf: 'Example-Core') > (loadedPackages indexOf: 'Project5');
    assert:
        (loadedPackages indexOf: 'Example-Core') > (loadedPackages indexOf: 'Project4');
    yourself