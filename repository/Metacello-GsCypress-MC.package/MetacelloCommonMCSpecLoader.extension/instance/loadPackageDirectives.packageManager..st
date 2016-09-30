*Metacello-GsCypress-MC
loadPackageDirectives: pkgLoads packageManager: packageManager
  | cypressLoad |
  pkgLoads
    do: [ :packageLoadDirective | 
      | resolvedReference |
      (resolvedReference := packageLoadDirective resolvedReference) ~~ nil
        ifTrue: [ cypressLoad addResolvedReference: resolvedReference ] ].
  Transcript
    cr;
    show: 'Starting atomic load'.
  cypressLoad loadResolvedReferences.
  pkgLoads
    do: [ :packageLoadDirective | 
      Transcript
        cr;
        tab;
        show:
            'Loaded -> ' , packageLoadDirective file , ' --- '
                , packageLoadDirective resolvedReference repository description ].
  Transcript
    cr;
    show: 'Finished atomic load'