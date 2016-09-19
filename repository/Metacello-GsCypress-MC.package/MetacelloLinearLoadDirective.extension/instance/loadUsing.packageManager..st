*Metacello-GsCypress-MC
loadUsing: aLoaderDirective packageManager: packageManager
  self loadDirectives isEmpty
    ifTrue: [ ^ self ].
  aLoaderDirective loadLinearLoadDirective: self packageManager: packageManager
