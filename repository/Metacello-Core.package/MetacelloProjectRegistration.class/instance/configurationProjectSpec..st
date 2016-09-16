accessing
configurationProjectSpec: anObject
  "force the registration to be consistent -- difficult for Metacello to 
   repair registrations during load -- I've tried. "

  "https://github.com/dalehenrich/metacello-work/issues/212"

  self shouldBeMutable.
  baselineProjectSpec := nil.
  anObject isConfigurationOfProjectSpec
    ifFalse: [ self error: 'Expected a configuration' ].
  configurationProjectSpec := anObject