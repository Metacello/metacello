private
linearLoadPackageSpec: packageSpec packageManager: packageManager
  | externalReference |
  self halt.	"create a cypress external reference that specifies the packageSpec and repositorySpec combo to be loaded"
  self preLoad: packageSpec.
  (MetacelloDirective
    loadPackage: packageSpec
    externalReference: externalReference
    loader: self) addTo: self loadDirective.
  self postLoad: packageSpec