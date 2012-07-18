handlers
handleOnDownGrade: onDownGradeBlock onUpgrade: onUpgradeBlock onLock: onLockBlock
    ^ onLockBlock cull: self cull: self projectRegistration cull: nil	"3 args for convenience if folks use three args in copy/paste episode"