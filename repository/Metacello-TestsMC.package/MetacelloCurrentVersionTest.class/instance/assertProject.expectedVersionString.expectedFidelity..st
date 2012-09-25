private
assertProject: project expectedVersionString: expectedVersionString expectedFidelity: expectedVersionStatus
    | cv versionStatus |
    cv := project currentVersion.
    Transcript
        cr;
        show: '--Current version: ' , cv printString.
    expectedVersionString == nil
        ifTrue: [ 
            ^ cv == nil
                ifFalse: [ self assert: cv versionStatus == #'somethingLoaded' ] ].	"validate current version"
    Transcript
        cr;
        show: '--Current version status: ' , cv versionStatus printString.
    self assert: cv = (project version: expectedVersionString).
    self assert: (versionStatus := cv versionStatus) == expectedVersionStatus