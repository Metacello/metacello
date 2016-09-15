tests
testBaselineProjectMergeSpec
  | projectA projectB project |
  projectA := self projectSpec
    name: 'Project';
    className: 'BaselineOfProject';
    loads: #('MyPackage');
    preLoadDoIt: #'preLoadDoIt';
    postLoadDoIt: #'postLoadDoIt';
    yourself.
  projectB := self projectSpec
    name: 'Project';
    className: 'BaselineOfProjectB';
    loads: #('MyPackage' 'MyTests');
    preLoadDoIt: #'preLoadDoItB';
    postLoadDoIt: #'postLoadDoItB';
    yourself.
  project := projectA mergeSpec: projectB.
  self assert: project name = 'Project'.
  self assert: project className = 'BaselineOfProjectB'.
  self assert: project loads = #('MyPackage' 'MyTests').
  self assert: project preLoadDoIt == #'preLoadDoItB'.
  self assert: project postLoadDoIt == #'postLoadDoItB'