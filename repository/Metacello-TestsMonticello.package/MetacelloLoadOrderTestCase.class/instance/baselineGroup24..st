baselines
baselineGroup24: spec
  <version: '2.4-baseline'>
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
        package: 'Example-Core' with: [ spec requires: 'Projects' ];
        yourself.
      spec
        group: 'Projects' with: #('Project1' 'OtherProjects');
        group: 'OtherProjects' with: #('Project2' 'Project3' 'TheRest');
        group: 'TheRest' with: #('Project4' 'Project5');
        yourself ]