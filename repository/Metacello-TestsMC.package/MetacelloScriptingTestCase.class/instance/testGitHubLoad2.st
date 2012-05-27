from GitHubTestCase ... recast
testGitHubLoad2
    | loaded |
    true
        ifTrue: [ ^ self ].
    Metacello new
        project: 'Sample';
        repository: 'github://dalehenrich/sample:1.0-beta.32Branch/core';
        load