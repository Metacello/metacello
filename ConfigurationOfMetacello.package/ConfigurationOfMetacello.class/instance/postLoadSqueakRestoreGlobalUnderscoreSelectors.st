doits
postLoadSqueakRestoreGlobalUnderscoreSelectors
  (Smalltalk at: #'Scanner')
    perform: #'prefAllowUnderscoreSelectors:'
    with:
      (Smalltalk at: #'MetacelloSqueakOriginalUnderscoreSelectorsPreferenceValue').
  Smalltalk
    removeKey: #'MetacelloSqueakOriginalUnderscoreSelectorsPreferenceValue'