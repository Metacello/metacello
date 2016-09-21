private
validateRegistrationForBaseline: baselineName expectedRepoDescription: repoDescription
  MetacelloProjectRegistration registry baselineRegistry
    at: baselineName
    ifPresent: [ :existing | 
      | spec x |
      spec := existing baselineProjectSpec.
      self assert: spec versionString = 'baseline'.
      self
        assert:
          ((x := spec repositories collect: [ :each | each createRepository description ])
            includes: repoDescription) ]
    ifAbsent: [ 
      "missing registration"
      self assert: false ]