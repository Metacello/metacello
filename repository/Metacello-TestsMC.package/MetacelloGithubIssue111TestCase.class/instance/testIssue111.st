tests
testIssue111
    | dir repo |
    dir := self getTestRepositoryDirectory.
    self assert: dir exists.
    repo := self getTestRepository.
    self
        shouldnt: [ 
            Metacello new
                configuration: 'Issue111';
                repository: (repo asRepositorySpecFor: MetacelloMCProject new) description;
                version: '3.1.0';
                silently;
                record ]
        raise: Error