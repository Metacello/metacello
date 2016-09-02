test packages only
testFeaux40Loaded
  | version fum projectFie projectFee foo feaux |
  gofer
    package: 'MetacelloTestConfigurationOfFum';
    package: 'MetacelloTestConfigurationOfFoo';
    package: 'MetacelloTestConfigurationOfFeaux';
    package: 'MetacelloTestConfigurationOfProjectFie';
    package: 'MetacelloTestConfigurationOfProjectFee';
    load.
  fum := (MetacelloPlatform current
    globalNamed: #'MetacelloTestConfigurationOfFum') new project.
  foo := (MetacelloPlatform current
    globalNamed: #'MetacelloTestConfigurationOfFoo') new project.
  feaux := (MetacelloPlatform current
    globalNamed: #'MetacelloTestConfigurationOfFeaux') new project.
  projectFie := (MetacelloPlatform current
    globalNamed: #'MetacelloTestConfigurationOfProjectFie') new project.
  projectFee := (MetacelloPlatform current
    globalNamed: #'MetacelloTestConfigurationOfProjectFee') new project.
  version := fum version: '4.0'.
  version load: #('Feaux').
  self assertProject: foo expectedVersionString: nil expectedFidelity: nil.
  self
    assertProject: feaux
    expectedVersionString: '4.0'
    expectedFidelity: #'allLoadedToSpec'.
  self
    assertProject: projectFie
    expectedVersionString: '4.0'
    expectedFidelity: #'loadedToSpec'.
  self
    assertProject: projectFee
    expectedVersionString: nil
    expectedFidelity: nil.
  self
    assertProject: fum
    expectedVersionString: '4.0'
    expectedFidelity: #'loadedToSpec'