querying
currentlyLoadedClassesInProject
    | classes |
    classes := Set new.
    self configurationProjectSpecIfPresent: [ :configuration |  ] ifAbsent: [  ].
    self baselineProjectSpecIfPresent: [ :baseline |  ] ifAbsent: [  ]