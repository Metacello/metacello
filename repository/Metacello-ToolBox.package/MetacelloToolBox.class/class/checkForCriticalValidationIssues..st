utility
checkForCriticalValidationIssues: configurationBasename
  "Validate the named configuration and filter out all non-critical issues."

  <apiDocumentation>
  ^ (MetacelloMCVersionValidator
    validateConfiguration:
      (MetacelloPlatform current
        globalNamed:
          (self configurationNameFrom: configurationBasename) asSymbol))
    select: [ :issue | issue isCritical ]