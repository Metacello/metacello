BranchX
branchBaselineX: spec
  <baseline>
  spec
    for: #'common'
    do: [ spec description: 'MetacelloAbstractBaselineResource>>branchBaselineX:'.
      spec
        package: 'Branch-CoreX' with: [ spec file: 'Branch-CoreX.prime' ];
        yourself.
      spec
        group: 'Core' with: #('Branch-CoreX');
        group: 'default' with: #('Core');
        yourself ]