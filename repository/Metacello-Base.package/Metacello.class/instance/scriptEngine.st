private
scriptEngine
    scriptEngine ifNil: [ scriptEngine := (self class scriptEngineClass: self ensureList) new ].
    ^ scriptEngine