private
linearLoadPackageSpec: packageSpec packageManager: packageManager
  | resolvedReference |
  resolvedReference := self
    resolvePackageSpecReference: packageSpec
    packageManager: packageManager.	"look up package spec"
  self preLoad: packageSpec.
  (MetacelloDirective
    loadPackage: packageSpec
    resolvedReference: resolvedReference
    loader: self) addTo: self loadDirective.
  self postLoad: packageSpec
