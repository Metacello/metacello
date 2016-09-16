scripting
copyAsConformingProjectSpec: aProjectSpec
  "Only needed when receiver is a MetacelloCypressBaselineProjectSpec and aProjectSpec is a MetacelloMCBaselineOfProjectSpec"

  ^ aProjectSpec copyAsConformingBaselineOfProjectSpec: self