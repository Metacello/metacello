test project
testProjectPackageCopy
  | project version projectSpec |
  project := self project.
  version := project version: '1.2.0-baseline'.
  projectSpec := version
    packageNamed: 'Example Project'
    ifAbsent: [ self assert: false ].
  self assert: projectSpec className = 'MetacelloExampleProjectConfig'.
  self assert: projectSpec preLoadDoIt = #'preloadForProject'.
  self assert: projectSpec postLoadDoIt = #'postloadForProject'.
  projectSpec := version
    packageNamed: 'Copied Example'
    ifAbsent: [ self assert: false ].
  self assert: projectSpec className = 'MetacelloExampleProjectConfig'.
  self assert: projectSpec preLoadDoIt = #'alternatePreloadForCore'.
  self assert: projectSpec postLoadDoIt = #'postloadForProject'