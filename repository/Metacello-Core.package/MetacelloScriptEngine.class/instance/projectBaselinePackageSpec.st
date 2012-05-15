private
projectBaselinePackageSpec
    | repoSpec project |
    project := (projectClass ifNil: [ MetacelloMCProject ]) new.
    repoSpec := self repositorySpec.
    self versionString isEmptyOrNil
        ifFalse: [ repoSpec := (repoSpec createRepository projectVersion: self versionString) asRepositorySpecFor: project ].
    ^ project packageSpec
        name: (self class baselineNameFrom: self projectName);
        repository: repoSpec;
        yourself