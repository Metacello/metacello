tests
testExternalLoad
    Metacello new
        project: 'External';
        repository: 'github://dalehenrich/external:1.0-beta.32Tests/core';
        load.
    Smalltalk at: #'ExternalCore'