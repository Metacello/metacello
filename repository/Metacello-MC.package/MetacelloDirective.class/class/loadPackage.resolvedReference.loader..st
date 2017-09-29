instance creation
loadPackage: aPackageSpec resolvedReference: resolvedReference loader: aLoader
  ^ MetacelloPackageLoadDirective new
    spec: aPackageSpec
    resolvedReference: resolvedReference
    loader: aLoader
