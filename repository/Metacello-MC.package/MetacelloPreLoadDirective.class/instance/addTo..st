actions
addTo: aLoaderDirective
  spec preLoadDoIt ~~ nil
    ifTrue: [ aLoaderDirective add: self ]