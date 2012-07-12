private
scriptExecutor
    scriptExecutor ifNil: [ scriptExecutor := (self class scriptExecutorClass: self ensureList) new ].
    ^ scriptExecutor