test projects only
testFoe40AllLoaded
  | version cv fum projectFie projectFee projectFoe foo feaux |
  gofer
    package: 'MetacelloTestConfigurationOfFum';
    package: 'MetacelloTestConfigurationOfFoo';
    package: 'MetacelloTestConfigurationOfFeaux';
    package: 'MetacelloTestConfigurationOfProjectFie';
    package: 'MetacelloTestConfigurationOfProjectFee';
    package: 'MetacelloTestConfigurationOfProjectFoe';
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
  projectFoe := (MetacelloPlatform current
    globalNamed: #'MetacelloTestConfigurationOfProjectFoe') new project.
  version := feaux version: '4.0'.
  version load: 'GeauxFoo'.
  version := projectFoe version: '4.0'.
  version load: #('ALL').
  gofer
    version: 'GeauxBeau-dkh.56';
    load.
  self
    assertProject: foo
    expectedVersionString: '4.0'
    expectedFidelity: #'loadedToSpec'.
  self
    assertProject: feaux
    expectedVersionString: '4.0'
    expectedFidelity: #'loadedToSpec'.
  self
    assertProject: projectFie
    expectedVersionString: '4.0'
    expectedFidelity: #'loadedToSpec'.
  self
    assertProject: projectFee
    expectedVersionString: '4.0'
    expectedFidelity: #'loadedMatchConstraints'.
  self
    assertProject: projectFoe
    expectedVersionString: '4.0'
    expectedFidelity: #'allLoadedToSpec'.
  self
    assertProject: fum
    expectedVersionString: '4.0'
    expectedFidelity: #'loadedMatchConstraints'