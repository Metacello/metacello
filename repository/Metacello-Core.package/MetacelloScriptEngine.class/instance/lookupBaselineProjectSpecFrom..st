project lookup
lookupBaselineProjectSpecFrom: aProjectSpec
    | registration projectSpec new |
    registration := MetacelloProjectRegistration registrationForProjectSpec: aProjectSpec ifAbsent: [ ^ aProjectSpec ].
    (registration hasLoadConflicts: (new := aProjectSpec asProjectRegistration))
        ifFalse: [ ^ aProjectSpec ].
    self halt.	"conflicts ...signal a notification to resolve conflict"
    projectSpec := registration baselineProjectSpecIfAbsent: [ ^ aProjectSpec ].
    Transcript
        cr;
        show:
                'Baseline already registered ' , projectSpec versionString printString , ' for project ' , projectSpec name printString.
    ^ projectSpec