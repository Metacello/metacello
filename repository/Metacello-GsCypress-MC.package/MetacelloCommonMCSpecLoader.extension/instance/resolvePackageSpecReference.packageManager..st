*Metacello-GsCypress-MC
resolvePackageSpecReference: packageSpec packageManager: packageManager
  | packageReference references |
  self hasRepositoryOverrides not
    ifTrue: [ 
      packageSpec repositorySpecs notEmpty
        ifTrue: [ 
          (self repositoriesFrom: packageSpec repositorySpecs ignoreOverrides: true)
            do: [ :repository | 
              packageManager knownRepositories
                at: repository url asString
                ifAbsent: [ self error: 'Packages not expected to have custom repository spec in cypress' ] ] ] ].
  packageReference := packageSpec cypressPackageReference.
  references := packageReference resolveAllWith: packageManager.
  references size ~= 1
    ifTrue: [ 
      | repoString |
      repoString := String
        streamContents: [ :stream | 
          packageManager knownRepositories keys
            do: [ :url | 
              stream
                nextPutAll: url;
                space ] ].
      references isEmpty
        ifTrue: [ 
          self
            error:
              'Reference for package ' , packageSpec file printString , ' not found in '
                , repoString printString ].
      self
        error:
          'More than on package reference found for ' , packageSpec file printString
            , ' in ' , repoString printString ].
  ^ references first