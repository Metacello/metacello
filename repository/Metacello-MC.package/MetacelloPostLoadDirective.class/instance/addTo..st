actions
addTo: aLoaderDirective
  spec postLoadDoIt ~~ nil
    ifTrue: [ aLoaderDirective add: self ]