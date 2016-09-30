*Metacello-GsCypress-MC
finalizeLoad: aPackageManager
  "load the accumulated packages (if any), reset the package list"

  | pkgLoads |
  self preloads do: [ :directive | super loadPreloadDirective: directive ].
  preloads := nil.
  (pkgLoads := self packageloads) notEmpty
    ifTrue: [ 
      self loader loadingSpecLoader
        loadPackageDirectives: pkgLoads
        packageManager: aPackageManager.
      self packageloads: nil ].
  self postloads do: [ :directive | super loadPostloadDirective: directive ].
  postloads := nil