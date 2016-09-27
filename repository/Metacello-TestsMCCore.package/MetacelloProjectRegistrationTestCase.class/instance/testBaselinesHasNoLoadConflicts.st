tests
testBaselinesHasNoLoadConflicts
  "specs not loaded and locked should not conflict"

  | baselineProjectSpecB |
  baselineProjectSpecB := self createBaselineProjectSpec
    className: 'BaselineOfNotDiscGolf'.
  registrationA baselineProjectSpec: baselineProjectSpec.
  registrationB baselineProjectSpec: baselineProjectSpecB.
  self deny: (registrationA hasLoadConflicts: registrationB)