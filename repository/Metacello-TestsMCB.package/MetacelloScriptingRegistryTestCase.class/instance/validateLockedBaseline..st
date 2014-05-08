as yet unclassified
validateLockedBaseline: rgstry
  | spec |
  spec := self validateLockedRegistrations: rgstry.
  self assert: spec == spec asBaselineProjectSpec