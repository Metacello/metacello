tests
testBleedingEdgeMethod
    | project |
    project := self projectWith: #(#'platformVersion1.x').
    self assert: (project version: #'bleedingEdge') = project bleedingEdge