tests
testOnWarningLogDuringLoad
  "see MetacelloScriptingWarningTestCase"

  | externalCoreClass repoExternal repoAlternate platform |
  platform := MetacelloPlatform current.
  repoExternal := 'filetree://'
    , (platform fullNameForDirectory: externalDirectory).
  Metacello new
    baseline: 'ExternalX';
    repository: repoExternal;
    silently;
    load.
  externalCoreClass := MetacelloPlatform current
    globalNamed: #'ExternalCoreX'
    ifAbsent: [ self assert: false ].
  self deny: (externalCoreClass selectors includes: #'forceWarning').
  MetacelloPlatform current
    compile: 'forceWarning ^self'
    inClass: externalCoreClass
    classified: 'testOnWarningLogDuringLoad'.	"dirty the package"
  self assert: (externalCoreClass selectors includes: #'forceWarning').
  [ 
  Metacello new
    baseline: 'ExternalX';
    repository: repoExternal;
    onWarningLog;
    silently;
    load ]
    on: Warning
    do: [ :ex | 
      "onWarningLog should catch and resume the Warning"
      self assert: false ]