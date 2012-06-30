accessing
repository
    self deprecated: 'Use repositories or repositorySpecs'.
    ^ (self configurationProjectSpecIfAbsent: [ self baselineProjectSpec ]) repository