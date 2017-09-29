handlers
handleOnDownGrade: onDownGradeBlock onUpgrade: onUpgradeBlock onLockedProjectChange: onProjectChangeBlock
  ^ onDownGradeBlock
    cull: self
    cull: self existingProjectRegistration
    cull: self newProjectRegistration
