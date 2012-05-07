*metacello-mc-accessing
baseline: aName repository: aRepoDescription
    | spec |
    spec := self project baselineSpec
        name: aName;
        repository: aRepoDescription;
        yourself.
    self root packages add: spec