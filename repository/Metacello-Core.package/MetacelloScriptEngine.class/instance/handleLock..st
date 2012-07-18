handlers
handleLock: exception
    ^ (self options at: #'onLock' ifAbsent: [ ^ exception pass ])
        cull: exception
        cull: exception projectRegistration
        cull: nil	"3 args for convenience if folks use three args in copy/paste episode"