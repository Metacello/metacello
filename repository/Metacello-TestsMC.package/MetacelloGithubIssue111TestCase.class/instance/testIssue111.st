tests
testIssue111
    "expect record to run without error ... leave potential error unhandled for ease of debugging"

    | dir repo |
    dir := self getTestRepositoryDirectory.
    self assert: dir exists.
    repo := self getTestRepository.
    Metacello new
        configuration: 'Issue111';
        repository: (repo asRepositorySpecFor: MetacelloMCProject new) description;
        version: '3.1.0';
        silently;
        record