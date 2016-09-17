*Metacello-GsCypress-MC
loadLinearLoadDirective: aLoaderDirective packageManager: aPackageManager
  aLoaderDirective loadDirectives
    do: [ :directive | directive loadUsing: aLoaderDirective  ].
  aLoaderDirective finalizeLoad: aPackageManager
