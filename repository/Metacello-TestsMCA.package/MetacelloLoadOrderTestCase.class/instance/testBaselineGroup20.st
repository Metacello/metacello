testing
testBaselineGroup20
  | project loader |
  project := self class new project.
  loader := project load: '2.0-baseline'.
  self baseline10Group20: loader