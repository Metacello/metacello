accessing
version
    | version |
    version := self projectSpec version.
    version silently: self silently.
    ^ version