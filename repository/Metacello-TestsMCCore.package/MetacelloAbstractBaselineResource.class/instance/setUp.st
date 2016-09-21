running
setUp
  "self reset"

  super setUp.
  self
    setUpRepositories;
    setUpExternalCoreX;
    setUpBaselineOfExternalX_external;
    setUpBaselineOfExternalX_alternate;
    setUpBaselineOfExternalRefX_alternate;
    yourself