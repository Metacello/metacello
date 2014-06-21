tests
testIssue250
  "https://github.com/dalehenrich/metacello-work/issues/250"

  | project version |
  gofer version: 'MetacelloTestConfigurationOfProjectIssue250-dkh.1'.
  gofer metacelloLoad.
  project := self project.
  version := project version: '2.0'.
  version load: #('GoferBar' 'GeauxFoo').
  version := project version: '2.1'.
  version load: #('GoferFoo')