accessing
version
    | version |
    self error: 'not expecting this puppy to be called anymore'.
    version := self projectSpec version.
    version silently: self silently.
    version ignoreImage: self ignoreImage.
    ^ version