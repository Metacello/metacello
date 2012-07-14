actions api
get
    "lookup project spec ... using standard technique, then load "

    self
        handleNotificationsForAction: [ 
            | spec |
            spec := self lookupProjectSpecFor: self projectSpec.
            self root: (spec project projectForScriptEngine: self unconditionalLoad: true) ]