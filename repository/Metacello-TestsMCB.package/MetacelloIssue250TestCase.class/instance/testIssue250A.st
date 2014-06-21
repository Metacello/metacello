tests
testIssue250A
  "https://github.com/dalehenrich/metacello-work/issues/250"

  Metacello new
    configuration: 'ProjectIssue250';
    className: 'MetacelloTestConfigurationOfProjectIssue250';
    version: '2.0';
    repository: 'dictionary://Metacello_Configuration_Test_Repository';
    load: #('GoferBar' 'GeauxFoo').
  Metacello new
    configuration: 'ProjectIssue250';
    className: 'MetacelloTestConfigurationOfProjectIssue250';
    version: '2.1';
    repository: 'dictionary://Metacello_Configuration_Test_Repository';
    load: #('GoferFoo')