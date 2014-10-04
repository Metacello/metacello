testing
testBaselineGroup22
  | project version loadedPackages |
  project := self class new project.
  version := project version: '2.2-baseline'.
  loadedPackages := version spec packageSpecsInLoadOrder asArray
    collect: [ :each | each name ].
  self assert: (loadedPackages indexOf: 'Example-Core') > 0.
  self
    assert:
        (loadedPackages indexOf: 'Example-AddOn')
            > (loadedPackages indexOf: 'Example-Core');
    assert:
        (loadedPackages indexOf: 'Example-Tests')
            > (loadedPackages indexOf: 'Example-AddOn');
    assert:
        (loadedPackages indexOf: 'Example-UI')
            > (loadedPackages indexOf: 'Example-AddOn');
    assert:
        (loadedPackages indexOf: 'Example-TestsUI')
            > (loadedPackages indexOf: 'Example-UI');
    assert:
        (loadedPackages indexOf: 'Example-TestsUI')
            > (loadedPackages indexOf: 'Example-Tests');
    assert:
        (loadedPackages indexOf: 'Example-Core') > (loadedPackages indexOf: 'Project1');
    assert:
        (loadedPackages indexOf: 'Example-AddOn') > (loadedPackages indexOf: 'Project2');
    assert:
        (loadedPackages indexOf: 'Example-Tests') > (loadedPackages indexOf: 'Project3');
    assert:
        (loadedPackages indexOf: 'Example-UI') > (loadedPackages indexOf: 'Project5');
    assert:
        (loadedPackages indexOf: 'Example-TestsUI')
            > (loadedPackages indexOf: 'Project4');
    yourself