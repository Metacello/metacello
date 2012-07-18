handlers
handleOnDownGrade: onDownGradeBlock onUpgrade: onUpgradeBlock onLock: onLockBlock
    ^ onUpgradeBlock cull: self cull: self existingProjectRegistration cull: self newProjectRegistration