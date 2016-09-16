repository teardown
teardownRepositories: repositoryList
  repositoryList
    do: [ :repo | MetacelloPlatform current cleanUpRepositoryGroupRemoving: repo ]