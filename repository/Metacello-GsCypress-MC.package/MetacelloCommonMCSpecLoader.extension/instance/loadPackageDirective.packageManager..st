*Metacello-GsCypress-MC
loadPackageDirective: aPackageLoadDirective packageManager: packageManager
  | resolvedReference |
  resolvedReference := aPackageLoadDirective resolvedReference.
  resolvedReference isNil
    ifTrue: [ ^ self error: 'Expected a resolved reference here' ].
  packageManager loadResolvedReference: resolvedReference.
  Transcript
    cr;
    show:
        'Loaded -> ' , resolvedReference name , ' --- '
            , resolvedReference repository description