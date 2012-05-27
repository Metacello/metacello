private
configurationProjectSpec
    | registration projectSpec project |
    project := MetacelloMCProject new.
    projectSpec := project projectSpec.
    ^ projectSpec
        name: 'DiscGolf';
        versionString: '1.0';
        repository: 'http://example.com/repository/OrchardPark';
        yourself