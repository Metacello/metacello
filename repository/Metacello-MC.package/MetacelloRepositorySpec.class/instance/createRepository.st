mc support
createRepository
  | repo |
  repo := self project createRepository: self.
  ^ MCRepositoryGroup default repositories
    detect: [ :each | each = repo ]
    ifFound: [ :each | self updateRepository: each ]
    ifNone: [ 
      MCRepositoryGroup default addRepository: repo.
      repo ]