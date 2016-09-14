tests
testBaselineProjectReferenceMergeSpec
  | projectReferenceA projectReferenceB projectReference project |
  projectReferenceA := self projectReferenceSpec
    name: 'Project';
    projectReference:
        (self baselineProjectSpec
            name: 'Project';
            className: 'BaselineOfProjectA';
            yourself);
    yourself.
  projectReferenceB := self projectReferenceSpec
    name: 'Project';
    projectReference:
        (self baselineProjectSpec
            name: 'Project';
            className: 'BaselineOfProjectB';
            yourself);
    yourself.
  projectReference := projectReferenceA mergeSpec: projectReferenceB.
  self assert: projectReference name = 'Project'.
  self assert: projectReference projectName = 'Project'.
  project := projectReference projectReference.
  self assert: project className = 'BaselineOfProjectB'