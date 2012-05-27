private
configurationProjectSpec
    ^ (projectClass ifNil: [ MetacelloMCProject ]) new configurationOfProjectSpec
        name: (self class configurationProjectNameOf: self projectName);
        versionString: self versionString;
        repository: self repositorySpec;
        yourself