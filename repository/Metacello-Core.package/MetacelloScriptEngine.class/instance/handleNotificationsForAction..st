handlers
handleNotificationsForAction: actionBlock
    [ 
    actionBlock
        on:
            MetacelloLookupProjectSpec , MetacelloLookupProjectSpecForLoad , MetacelloProjectSpecLoadedNotification
                , MetacelloScriptEnsureProjectLoadedForDevelopment
        do: [ :ex | 
            "lookup and registration handlers need to be innermost set of handlers ...they may throw option notifications"
            ex handleResolutionFor: self ] ]
        on: MetacelloAllowProjectDowngrade , MetacelloAllowProjectUpgrade , MetacelloAllowConflictingProjectUpgrade
        do: [ :ex | 
            "option handlers need to be outermost set of handlers ... last line of defense before users are involved"
            ex handleResolutionFor: self ]