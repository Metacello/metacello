doits
preLoadSqueakEnsureGlobalUnderscoreSelectors
  Smalltalk
    at: #'MetacelloSqueakOriginalUnderscoreSelectorsPreferenceValue'
    put: ((Smalltalk at: #'Scanner') perform: #'prefAllowUnderscoreSelectors').
  (Smalltalk at: #'Scanner')
    perform: #'prefAllowUnderscoreSelectors:'
    with: true.
  ($_ perform: #'tokenish')
    ifFalse: [ 
      Character
        perform: #'compile:classified:'
        with:
          'tokenish
        "Answer whether the receiver is a valid token-character--letter, digit, or
        colon."

        ^self == $_ or: [self == $: or: [self isLetter or: [self isDigit]]]'
        with: 'testing'.
      String initialize ]