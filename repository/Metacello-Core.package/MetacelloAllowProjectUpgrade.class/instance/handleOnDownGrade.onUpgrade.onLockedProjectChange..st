handlers
handleOnDownGrade: onDownGradeBlock onUpgrade: onUpgradeBlock onLockedProjectChange: onProjectChangeBlock
  ^ onUpgradeBlock
    cull: self
    cull: self existingProjectRegistration
    cull: self newProjectRegistration