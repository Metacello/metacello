tests
testFileTreeUrl
  | repo |
  repo := MetacelloPlatform current
    repositoryFromUrl: 'filetree:///opt/git/filetree/repository' asUrl.
  self assert: repo class == MCFileTreeRepository