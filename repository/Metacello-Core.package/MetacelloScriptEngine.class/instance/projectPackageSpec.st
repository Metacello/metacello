private
projectPackageSpec
    ^ (projectClass ifNil: [ MetacelloMCProject ]) new packageSpec
        name: (self class configurationNameFrom: self projectName);
        repository: self repositorySpec;
        yourself