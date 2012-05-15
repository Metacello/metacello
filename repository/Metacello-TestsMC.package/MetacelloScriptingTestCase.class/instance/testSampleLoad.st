from GitHubTestCase ... recast
testSampleLoad
    true
        ifTrue: [ ^ self ].
    Metacello new
        project: 'Sample';
        repository: 'github://dalehenrich/sample:1.0-beta.32Branch/core';
        load.
    Smalltalk at: #'ExternalCore'.
    Smalltalk at: #'SampleCore'.
    Smalltalk at: #'SamplePlatform'.
    Smalltalk at: #'SampleTests'