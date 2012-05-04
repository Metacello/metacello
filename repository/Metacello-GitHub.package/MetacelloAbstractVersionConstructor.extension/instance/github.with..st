*metacello-github
github: aString with: aBlock
    | spec githubProjectSpec |
    githubProjectSpec := self project githubProjectSpec
        name: aString;
        yourself.
    spec := self project projectReferenceSpec
        name: aString;
        projectReference: githubProjectSpec;
        yourself.
    self root packages merge: spec.
    self with: githubProjectSpec during: aBlock