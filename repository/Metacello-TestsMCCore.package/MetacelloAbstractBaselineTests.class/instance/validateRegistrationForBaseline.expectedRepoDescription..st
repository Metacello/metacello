private
validateRegistrationForBaseline: baselineName expectedRepoDescription: repoDescription
  "Ensure that the repoDescription resolves to the same description --- filetree:// and globalrepo: schemes resolve to alternate urls for cypress"

  | description |
  description := (MetacelloPlatform current
    repositoryFromUrl: repoDescription asUrl) description.
  (MetacelloProjectRegistration registry baselineRegistry
    at: baselineName
    ifAbsent: [  ])
    ifNil: [ 
      "missing registration"
      self assert: false ]
    ifNotNil: [ :existing | 
      | spec x |
      spec := existing baselineProjectSpec.
      self assert: spec versionString = 'baseline'.
      self
        assert:
          ((x := spec repositories collect: [ :each | each createRepository description ])
            includes: description) ]