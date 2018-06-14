tests
testStableVersionMethod
    | project |
    project := self projectWith: #(#'platformVersion1.x').
    self assert: (project version: #'stable') = project stableVersion