tests
testBaselinesHasLoadConflicts
  "specs not loaded and locked should not conflict"

  | baselineProjectSpecB |
  baselineProjectSpecB := self createBaselineProjectSpec
    className: 'BaselineOfNotDiscGolf'.
  registrationA loadedInImage: true.
  registrationA baselineProjectSpec: baselineProjectSpec.
  registrationB baselineProjectSpec: baselineProjectSpecB.
  self assert: (registrationA hasLoadConflicts: registrationB)