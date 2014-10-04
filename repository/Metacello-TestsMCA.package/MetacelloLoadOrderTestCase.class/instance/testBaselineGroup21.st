testing
testBaselineGroup21
  | project loader loadedPackages |
  project := self class new project.
  loader := project load: '2.1-baseline'.
  self baseline10Group20: loader.
  loadedPackages := loader loadedPackages asArray.
  self assert: (loadedPackages indexOf: 'Example-Core') > 0.
  self
    assert:
        (loadedPackages indexOf: 'Example-CoreB')
            > (loadedPackages indexOf: 'Example-Core');
    assert:
        (loadedPackages indexOf: 'Example-Sub1')
            > (loadedPackages indexOf: 'Example-CoreB');
    assert:
        (loadedPackages indexOf: 'Example-Sub2')
            > (loadedPackages indexOf: 'Example-Sub1');
    assert:
        (loadedPackages indexOf: 'Example-AddOn')
            > (loadedPackages indexOf: 'Example-CoreB');
    assert:
        (loadedPackages indexOf: 'Example-Tests')
            > (loadedPackages indexOf: 'Example-AddOn');
    assert:
        (loadedPackages indexOf: 'Example-TestsUI')
            > (loadedPackages indexOf: 'Example-Tests');
    assert:
        (loadedPackages indexOf: 'Example-TestsUI')
            > (loadedPackages indexOf: 'Example-UI');
    assert:
        (loadedPackages indexOf: 'Example-TestsUI')
            > (loadedPackages indexOf: 'Example-Sub2');
    assert:
        (loadedPackages indexOf: 'Example-UI')
            > (loadedPackages indexOf: 'Example-CoreB');
    yourself