monticello
goferLoadBlockFor: aGofer resolvedReference: resolvedReference
  "Need to be able to survive across the package refactoring boundary"

  ^ [ 
  | goferLoad |
  "mcLoader preLoad: packageSpec."
  goferLoad := MetacelloGoferLoad on: aGofer.
  goferLoad addResolved: resolvedReference.
  goferLoad execute.
  MetacelloPlatform current clearCurrentVersionCache	"mcLoader postLoad: packageSpec" ]