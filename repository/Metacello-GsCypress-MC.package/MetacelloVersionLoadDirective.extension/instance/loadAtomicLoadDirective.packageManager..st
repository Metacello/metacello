*Metacello-GsCypress-MC
loadAtomicLoadDirective: aLoaderDirective packageManager: aPackageManager
  aLoaderDirective loadDirectives
    do: [ :directive | directive loadUsing: aLoaderDirective packageManager: aPackageManager ].
  aLoaderDirective finalizeLoad: aPackageManager