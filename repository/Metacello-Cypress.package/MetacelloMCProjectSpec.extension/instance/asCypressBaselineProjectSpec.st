*metacello-cypress
asCypressBaselineProjectSpec
  ^ self
    copyForScriptingInto:
      (MetacelloCypressBaselineProjectSpec for: self project asCypressBaselineProject)