deploy
releaseProject: project version: versionString from: sourceRepository to: targetRepositories
    | configurationPackageName gofer targetRepository fileName issues version |
    configurationPackageName := project class name asString.
    Transcript
        cr;
        show: 'Validating configuration: ' , configurationPackageName printString.
    (issues := MetacelloToolBox validateProject: project version: versionString) isEmpty
        ifFalse: [ self error: 'configuration validation issues' ].
    project projectPackage workingCopy modified
        ifTrue: [ self error: 'Configuration is dirty in the image' ].
    version := project version: versionString.
    project stableVersion = version
        ifFalse: [ self error: 'Release version not declared as stable: ' , project stableVersion versionString printString ].
    (version importedVersions includes: project bleedingEdge versionString)
        ifFalse: [ 
            self
                error:
                    'Incorrect bleeding edge version: ' , project bleedingEdge versionString printString , ' should be '
                        , version importedVersions first printString ].
    version blessing == #'release'
        ifFalse: [ self error: 'Blessing is not release: ' , version blessing printString ].
    gofer := Gofer new.
    gofer repository: sourceRepository.
    Transcript
        cr;
        show: 'Fetching....'.
    gofer package: configurationPackageName.
    gofer fetch.
    gofer := Gofer new.
    targetRepositories do: [ :repo | gofer repository: repo ].
    Transcript
        cr;
        show: 'Pushing....'.
    gofer version: project projectPackage file.
    gofer push.
    Transcript
        cr;
        show: 'DONE' P