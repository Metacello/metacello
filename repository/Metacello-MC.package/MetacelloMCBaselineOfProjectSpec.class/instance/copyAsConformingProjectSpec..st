scripting
copyAsConformingProjectSpec: aMetacelloProject
  "Only needed when receiver is a MetacelloMCBaselineOfProjectSpec and aMetacelloProject is a MetacelloCypressBaselineProject"

  ^ aMetacelloProject copyAsConformingBaselineOfProjectSpec: self