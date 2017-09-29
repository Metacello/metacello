*metacello-mc
projectSpecCreationBlock
  | platform |
  platform := MetacelloPlatform current.
  platform
    globalNamed: 'MetacelloCypressBaselineProject'
    ifPresent: [ :cypressBaselineProjectClass | 
      platform useCypressByDefault
        ifTrue: [ ^ [ :projectName | {(cypressBaselineProjectClass new baselineOfProjectSpec name: projectName)} ] ] ].
  ^ [ :projectName | {(MetacelloMCBaselineProject new baselineOfProjectSpec name: projectName)} ]
