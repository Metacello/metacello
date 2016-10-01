RecordX
recordBaselineRefX: spec
  <baseline>
  spec
    for: #'common'
    do: [ 
      spec description: 'MetacelloAbstractBaselineResource>>recordBaselineRefX:'.
      spec
        baseline: 'AtomicX'
          with: [ spec repository: 'globalrepo:Metacello_ExternalX_ExternalRepository_URL' ];
        yourself.
      spec
        group: 'Core' with: #('AtomicX');
        group: 'default' with: #('Core');
        yourself ]