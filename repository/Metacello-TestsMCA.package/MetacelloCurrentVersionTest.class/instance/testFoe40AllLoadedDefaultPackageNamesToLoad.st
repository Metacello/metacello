test projects only
testFoe40AllLoadedDefaultPackageNamesToLoad
  | version fum projectFie projectFee projectFoe foo feaux packageNames |
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
  packageNames := version defaultPackageNamesToLoad.
  self assert: packageNames size == 2.
  self assert: (packageNames includes: 'GeauxFoo').
  self assert: (packageNames includes: 'GeauxBar').
  packageNames := version defaultPackageNamesToLoad: #('GeauxFoo').
  self assert: packageNames size == 1.
  self assert: (packageNames includes: 'GeauxFoo').
  version load: 'GeauxFoo'.
  packageNames := version defaultPackageNamesToLoad: #('GeauxFoo').
  self assert: packageNames size == 1.
  self assert: (packageNames includes: 'GeauxFoo').
  version := projectFoe version: '4.0'.
  version load: #('ALL').
  packageNames := (foo version: '4.0') defaultPackageNamesToLoad.
  self assert: packageNames size == 6.
  self assert: (packageNames includes: 'GoferFoo').
  self assert: (packageNames includes: 'GoferBar').
  packageNames := (foo version: '4.0') defaultPackageNamesToLoad: #().
  self assert: packageNames size == 2.
  self assert: (packageNames includes: 'GoferFoo').
  self assert: (packageNames includes: 'GoferBar')