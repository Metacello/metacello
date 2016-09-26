private
linearLoadPackageSpec: packageSpec packageManager: packageManager
  | externalReference references |
  externalReference := self
    resolvePackageSpecReference: packageSpec
    packageManager: packageManager.	"look up package spec"
  self preLoad: packageSpec.
  (MetacelloDirective
    loadPackage: packageSpec
    externalReference: externalReference
    loader: self) addTo: self loadDirective.
  self postLoad: packageSpec