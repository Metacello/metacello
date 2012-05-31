from GitHubTestCase ... recast
testExternalGet
    | project version |
    true
        ifTrue: [ ^ self ].
    project := Metacello new
        project: 'External';
        repository: 'github://dalehenrich/external:1.0-beta.32Tests/core';
        get.
    version := project version.
    version packageNamed: 'External-Core'