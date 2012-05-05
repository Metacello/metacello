private
projectBaselinePackageSpec
    ^ (projectClass ifNil: [ MetacelloMCProject ]) new packageSpec
        name: (self class baselineNameFrom: self projectName);
        repository: self repositorySpec;
        yourself