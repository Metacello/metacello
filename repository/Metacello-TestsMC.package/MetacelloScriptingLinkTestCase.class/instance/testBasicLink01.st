tests
testBasicLink01
    | projectSpec expectedProjectSpec |
    true
        ifTrue: [ ^ self ].
    expectedProjectSpec := MetacelloMCProject new configurationOfProjectSpec
        name: 'ExternalX';
        versionString: '0.9';
        repository: 'filetree://' , configurationDirectory fullName.
    projectSpec := Metacello new
        configuration: 'ExternalX';
        version: '0.9';
        repository: 'filetree://' , configurationDirectory fullName;
        register.
    self assert: (expectedProjectSpec compareEqual: projectSpec).
    MetacelloProjectRegistration
        registrationForProjectSpec: projectSpec
        ifAbsent: [ :new | self assert: false ]
        ifPresent: [ :existing :new | self assert: (existing configurationProjectSpec compareEqual: projectSpec) ]