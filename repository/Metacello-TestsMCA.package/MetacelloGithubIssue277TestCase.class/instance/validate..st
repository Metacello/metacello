private
validate: spec
  | repo |
  repo := MCGitHubRepository parseLocation: (spec at: 1) version: nil.
  self assert: repo description = (spec at: 2).
  self assert: repo projectPath = (spec at: 3).
  self assert: repo projectVersion = (spec at: 4).
  self assert: repo repoPath = (spec at: 5).
  ^ repo