*Metacello-GsCypress-MC
loadUsing: aLoaderDirective packageManager: aPackageManager
  self loadDirectives isEmpty
    ifTrue: [ ^ self ].
  aLoaderDirective loadAtomicLoadDirective: self packageManager: aPackageManager