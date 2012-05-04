tests
testExternalGet
    | project version |
    project := Metacello new
        project: 'External';
        repository: 'github://dalehenrich/external:1.0-beta.32Tests/core';
        get.
    version := project version: 'baseline'.
    version packageNamed: 'External-Core'