*metacello-monticello-mc
loadPackageDirective: aPackageLoadDirective gofer: aGofer
  | packageSpec |
  packageSpec := aPackageLoadDirective spec.
  MetacelloPlatform current
    do: [ 
      | loadBlock goferLoad answers resolvedReference |
      aGofer disablePackageCache.	"for good luck:)"
      resolvedReference := self resolvePackageSpec: packageSpec gofer: aGofer.
      resolvedReference isNil
        ifTrue: [ 
          "Package version already loaded into image"
          ^ self ].
      loadBlock := MetacelloPlatform current
        goferLoadBlockFor: aGofer
        resolvedReference: resolvedReference.
      (answers := packageSpec answers) notEmpty
        ifTrue: [ loadBlock valueSupplyingMetacelloAnswers: answers ]
        ifFalse: [ loadBlock value ].
      resolvedReference workingCopy repositoryGroup
        addRepository: aPackageLoadDirective repository.
      Transcript
        cr;
        show:
            'Loaded -> ' , resolvedReference name , ' --- '
                , aPackageLoadDirective repository repositoryDescription
                , ' --- ' , resolvedReference repository description ]
    displaying: 'Loading ' , packageSpec file