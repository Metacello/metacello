*Metacello-GsCypress-MC
loadAtomicLoadDirective: aLoaderDirective packageManager: aPackageManager
  aLoaderDirective loadDirectives
    do: [ :directive | directive loadUsing: self packageManager: aPackageManager ]