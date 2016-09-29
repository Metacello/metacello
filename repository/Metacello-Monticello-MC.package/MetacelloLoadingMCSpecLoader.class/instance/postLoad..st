doits
postLoad: packageOrVersionSpec
  | block |
  (block := packageOrVersionSpec postLoadDoItBlock) ~~ nil
    ifTrue: [ block cull: self cull: packageOrVersionSpec ]