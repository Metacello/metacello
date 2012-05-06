tests
testSampleLoad
    Metacello new
        project: 'Sample';
        repository: 'github://dalehenrich/sample:1.0-beta.32Tests/core';
        load.
    Smalltalk at: #'ExternalCore'.
    Smalltalk at: #'SampleCore'.
    Smalltalk at: #'SamplePlatform'.
    Smalltalk at: #'SampleTests'