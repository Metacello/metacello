actions api
load: required onProjectDownGrade: onDownGradeBlock onProjectUpgrade: onUpgradeBlock onLockedProjectChange: onProjectChangeBlock
  MetacelloProjectRegistration
    copyRegistryRestoreOnErrorWhile: [ 
      self
        handleNotificationsForAction: [ 
          | version loadedSpec |
          self setDefaultsAndValidateProjectSpec.
          [ loadedSpec := (self lookupProjectSpecFor: self projectSpec) copy ]
            on:
              MetacelloAllowProjectDowngrade , MetacelloAllowProjectUpgrade
                , MetacelloAllowLockedProjectChange
            do: [ :ex | 
              ex
                handleOnDownGrade: onDownGradeBlock
                onUpgrade: onUpgradeBlock
                onLockedProjectChange: onProjectChangeBlock ].
          version := loadedSpec versionForScriptEngine: self.
          self
            root:
              (required isEmpty
                ifTrue: [ version load ]
                ifFalse: [ version load: required ]) loadDirective.
          loadedSpec loads: required.
          MetacelloProjectRegistration
            registrationForProjectSpec: loadedSpec
            ifAbsent: [ :new | 
              new
                loadedInImage: true;
                registerProject ]
            ifPresent: [ :existing :new | 
              existing
                copyOnWrite: [ :existingCopy | 
                  existingCopy
                    loadedInImage: true;
                    merge: new ] ] ] ]
