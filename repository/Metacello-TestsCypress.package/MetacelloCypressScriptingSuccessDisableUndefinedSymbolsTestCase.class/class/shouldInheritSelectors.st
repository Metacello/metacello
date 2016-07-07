Testing
shouldInheritSelectors
  Smalltalk
    at: #'SystemVersion'
    ifAbsent: [ :ignored | 
      "Copy of 3.x variant of TestCase class>>shouldInheritSelectors -- needed for 2.4.8 ... older version of shouldInheritSelectors isn't quite correct in this case."
      ^ self ~~ self lookupHierarchyRoot
        and: [ self superclass isAbstract or: [ self testSelectors isEmpty ] ] ].
  ^ super shouldInheritSelectors