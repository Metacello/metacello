testing
testBaseline10
  | project loader |
  project := self class new project.
  loader := project load: '1.0-baseline'.
  self baseline10Group20: loader