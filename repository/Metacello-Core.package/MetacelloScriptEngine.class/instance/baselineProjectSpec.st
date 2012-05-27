private
baselineProjectSpec
    ^ (projectClass ifNil: [ MetacelloMCProject ]) new baselineOfProjectSpec
        name: (self class baselineProjectNameOf: self projectName);
        repository: self repositorySpec;
        yourself