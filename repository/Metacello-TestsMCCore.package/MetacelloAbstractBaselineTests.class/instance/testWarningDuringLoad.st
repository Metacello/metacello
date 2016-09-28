tests
testWarningDuringLoad
  "dirty packages should casue a warning on load ... Cypress are you listening?"

  "prerequisite for testOnWarningLogDuringLod"

  | externalCoreClass repoExternal repoAlternate platform warningSignalled |
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
  warningSignalled := false.
  [ 
  Metacello new
    baseline: 'ExternalX';
    repository: repoExternal;
    silently;
    load ]
    on: Warning
    do: [ :ex | warningSignalled := true ].
  self assert: warningSignalled