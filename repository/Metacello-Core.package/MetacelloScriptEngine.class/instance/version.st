version accessing
version
    | version |
    version := self projectClass versionFrom: self.
    version silently: self silently.
    ^ version