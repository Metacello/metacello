BranchX
setUpBranchCoreX
  "self reset"

  self
    setUpBranchCoreX: 'prime'
      packageRepo: externalPackages
      packageVersion: '-dkh.1';
    setUpBranchCoreX: 'gemstone'
      packageRepo: externalPackages
      packageVersion: '-dkh.1';
    setUpBranchCoreX: 'squeak'
      packageRepo: externalPackages
      packageVersion: '-dkh.1';
    yourself