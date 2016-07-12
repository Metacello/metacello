Accessing
allTestSelectors
  Smalltalk
    at: #'SystemVersion'
    ifAbsent: [ 
      | answer pivotClass lookupRoot |
      "Copy of 3.x variant of TestCase class>>allTestSelectors -- needed for 2.4.8 ... older version of shouldInheritSelectors isn't quite correct in this case."
      answer := Set withAll: self testSelectors.
      self shouldInheritSelectors
        ifTrue: [ 
          pivotClass := self.
          lookupRoot := self lookupHierarchyRoot.
          [ pivotClass == lookupRoot ]
            whileFalse: [ 
              pivotClass := pivotClass superclass.
              answer addAll: pivotClass testSelectors ] ].
      ^ answer asSortedCollection asOrderedCollection ].
  ^ super allTestSelectors