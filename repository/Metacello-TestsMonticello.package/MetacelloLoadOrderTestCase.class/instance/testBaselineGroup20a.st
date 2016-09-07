testing
testBaselineGroup20a
  | project loader |
  project := self class new project.
  loader := project load: '2.0-a-baseline'.
  self baseline10Group20: loader