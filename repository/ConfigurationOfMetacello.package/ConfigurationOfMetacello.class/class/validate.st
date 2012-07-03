development support
validate
    "self validate"

    self ensureMetacello.
    ^ ((Smalltalk at: #'MetacelloToolBox') validateConfiguration: self debug: #() recurse: false) explore