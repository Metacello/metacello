testing
testBaseline10a
  | project loader |
  project := self class new project.
  loader := project load: '1.0-a-baseline'.
  self baseline10Group20: loader