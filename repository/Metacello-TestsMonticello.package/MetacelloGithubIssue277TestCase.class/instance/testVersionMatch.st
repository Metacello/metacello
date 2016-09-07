tests
testVersionMatch
  {{'v1.*.*.*-gs'.
  {('1-gs' -> false).
  ('1.0-gs' -> false).
  ('1.0.0-gs' -> false).
  ('1.0.0.15-gs' -> true)}}.
  {'v1.*.*-gs'.
  {('1.0.0-gs' -> true).
  ('1.0.0.15-gs' -> false).
  ('1.0.0' -> false).
  ('1.0-gs' -> false).
  ('1.1.0-gs' -> true).
  ('1.1.0.15-gs' -> false).
  ('1.1.0-gx' -> false).
  ('1.1.0-gsx' -> false).
  ('1.1.0' -> false).
  ('1.0.1-gs' -> true).
  ('1.1.1-gs' -> true).
  ('1.1.10-gs' -> true).
  ('1.10.0-gs' -> true).
  ('2.0.0-gs' -> false)}}.
  {'v1.1.?'.
  {('1.0.0-gs' -> false).
  ('1.0.0.15-gs' -> false).
  ('1.0.0' -> false).
  ('1.1.0-gs' -> true).
  ('1.1.0.15-gs' -> true).
  ('1.1.0-gx' -> true).
  ('1.1.0-gsx' -> true).
  ('1.1.0' -> true).
  ('1.0.1-gs' -> false).
  ('1.1.1-gs' -> true).
  ('1.1.10-gs' -> true).
  ('1.10.0-gs' -> false).
  ('2.0.0-gs' -> false)}}.
  {'v1.1.0-g#'.
  {('1.0.0-gs' -> false).
  ('1.0.0.15-gs' -> false).
  ('1.0.0' -> false).
  ('1.1.0-gs' -> true).
  ('1.1.0.15-gs' -> false).
  ('1.1.0-gx' -> true).
  ('1.1.0-gsx' -> false).
  ('1.1.0' -> false).
  ('1.0.1-gs' -> false).
  ('1.1.1-gs' -> false).
  ('1.1.10-gs' -> false).
  ('1.10.0-gs' -> false).
  ('2.0.0-gs' -> false)}}}
    do: [ :spec | 
      | patternString |
      patternString := (MCGitBasedNetworkRepository
        projectVersionFromString: (spec at: 1)) asString.
      (spec at: 2)
        do: [ :matchAssoc | 
          | versionString expected version |
          versionString := matchAssoc key.
          expected := matchAssoc value.
          version := MCGitBasedNetworkRepository
            projectVersionFromString: versionString.
          self assert: (version match: patternString) == expected ] ]