handlers
handleOnDownGrade: onDownGradeBlock onUpgrade: onUpgradeBlock onLockedProjectChange: onProjectChangeBlock
  ^ onProjectChangeBlock
    cull: self
    cull: self existingProjectRegistration
    cull: self newProjectRegistration