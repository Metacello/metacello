mc support
createRepository
  | repo |
  repo := self project createRepository: self.
  ^ self updateRepository: (MCRepositoryGroup default repositories
    detect: [ :each | each = repo ]
    ifNone: [ 
      MCRepositoryGroup default addRepository: repo.
      repo ])