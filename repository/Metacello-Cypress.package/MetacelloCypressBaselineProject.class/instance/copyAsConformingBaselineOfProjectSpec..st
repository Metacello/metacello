scripting
copyAsConformingBaselineOfProjectSpec: aMetacelloMCBaselineOfProjectSpec
  "convert the MetacelloMCBaselineOfProjectSpec into a MetacelloCypressBaselineProjectSpec"

  | aCypressProjectSpec |
  aCypressProjectSpec := MetacelloCypressBaselineProjectSpec for: self.
  ^ aMetacelloMCBaselineOfProjectSpec copyForScriptingInto: aCypressProjectSpec