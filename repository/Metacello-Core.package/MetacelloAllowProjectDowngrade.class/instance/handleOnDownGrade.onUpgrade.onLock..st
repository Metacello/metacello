handlers
handleOnDownGrade: onDownGradeBlock onUpgrade: onUpgradeBlock onLock: onLockBlock
    ^ onDownGradeBlock cull: self cull: self existingProjectRegistration cull: self newProjectRegistration