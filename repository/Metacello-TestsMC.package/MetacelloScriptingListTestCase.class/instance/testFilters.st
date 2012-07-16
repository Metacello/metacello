tests
testFilters
    Metacello new
        baseline: 'GithubRefIV';
        repository: 'filetree://' , externalDirectory fullName;
        silently;
        load.
    Metacello new
        configuration: 'Issue32';
        repository: 'dictionary://Metacello_Configuration_Test_Repository';
        silently;
        get.
    Metacello new
        baseline: 'Issue32';
        repository: 'dictionary://Metacello_External_Test_Repository';
        silently;
        get.
    self
        validateImageNameFilter;
        validateImageCollectionFilter;
        validateImageBlockFilter.
    true
        ifTrue: [ 
            "need registration implemented for this test ... may not need to get the configs"
            ^ self ].
    self
        validateRegistryNameFilter;
        validateRegistryCollectionFilter;
        validateRegistryBlockFilter