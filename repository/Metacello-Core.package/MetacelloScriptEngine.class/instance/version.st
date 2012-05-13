version accessing
version
    | version |
    version := self projectClass versionFrom: self.
    self options at: #'silently' ifPresent: [ :aBool | version silently: aBool ].
    ^ version