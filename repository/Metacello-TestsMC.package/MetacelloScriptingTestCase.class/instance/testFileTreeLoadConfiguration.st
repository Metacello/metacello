tests
testFileTreeLoadConfiguration
    | registry registration configurationProjectSpec baselineProjectSpec |
    Metacello new
        project: 'ExternalX';
        version: '0.9';
        repository: 'filetree://' , configurationDirectory fullName;
        silently;
        load.
    registry := MetacelloProjectRegistration registry.
    self assert: registry size = 1.
    registration := registry at: 'ExternalX'.
    configurationProjectSpec := registration configurationProjectSpec.
    baselineProjectSpec := registration baselineProjectSpec.
    self assert: configurationProjectSpec versionString = '0.9'.
    self assert: configurationProjectSpec repository description = ('filetree://' , configurationDirectory fullName).
    self assert: baselineProjectSpec versionString = 'baseline'