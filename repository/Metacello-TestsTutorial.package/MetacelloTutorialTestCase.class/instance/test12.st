tests
test12
  | project versionSpec |
  project := self project.
  versionSpec := (project version: '1.2') spec.
  self
    assert:
      (versionSpec packages map at: 'Example-Core') preLoadDoIt == #'preloadForCore'.
  self
    assert:
      (versionSpec packages map at: 'Example-Core') postLoadDoIt
        == #'postloadForCore:package:'.
  (project version: '1.2') load	"execute without error"