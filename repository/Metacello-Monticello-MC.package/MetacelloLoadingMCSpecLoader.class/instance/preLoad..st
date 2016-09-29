doits
preLoad: packageOrVersionSpec
  | block |
  (block := packageOrVersionSpec preLoadDoItBlock) ~~ nil
    ifTrue: [ block cull: self cull: packageOrVersionSpec ]