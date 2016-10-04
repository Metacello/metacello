doits
testResourcePostLoadDoIt
  "reset test resources"

  #(#'MetacelloAlternateResource' #'MetacelloAtomicConfigurationResource' #'MetacelloAtomicMonticelloResource' #'MetacelloConfigurationResource' #'MetacelloMonticelloResource' #'MetacelloScriptingResource' #'MetacelloIssue108Resource' #'MetacelloAbstractBaselineResource')
    do: [ :className | MetacelloPlatform current globalNamed: className ifPresent: [ :cls | cls reset ] ]