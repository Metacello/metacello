baselines
baselineGroup22: spec
  <version: '2.2-baseline'>
  spec
    for: #'common'
    do: [ 
      spec
        baseline: 'Project1'
          with: [ spec repository: 'dictionary://Metacello_Project_Test_Repository' ];
        baseline: 'Project2'
          with: [ spec repository: 'dictionary://Metacello_Project_Test_Repository' ];
        baseline: 'Project3'
          with: [ spec repository: 'dictionary://Metacello_Project_Test_Repository' ];
        baseline: 'Project4'
          with: [ spec repository: 'dictionary://Metacello_Project_Test_Repository' ];
        baseline: 'Project5'
          with: [ spec repository: 'dictionary://Metacello_Project_Test_Repository' ];
        yourself.
      spec
        package: 'Example-Core' with: [ spec requires: #('Project1') ];
        package: 'Example-AddOn'
          with: [ spec requires: #('Core Group' 'Project2') ];
        package: 'Example-Tests'
          with: [ spec requires: #('AddOn Group' 'Project3') ];
        package: 'Example-TestsUI'
          with: [ spec requires: #('TestsUI Group' 'Project4') ];
        package: 'Example-UI'
          with: [ spec requires: #('AddOn Group' 'Project5') ].
      spec
        group: 'TestsUI Group' with: #('Example-UI' 'Example-Tests');
        group: 'Core Group' with: #('Example-Core');
        group: 'AddOn Group' with: #('Example-AddOn');
        yourself ]