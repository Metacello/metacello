tests
testFileTreeUrl
  | repo |
  repo := MetacelloPlatform current repositoryFromUrl: 'filetree:///tmp' asUrl.
  self assert: repo class == MCFileTreeRepository