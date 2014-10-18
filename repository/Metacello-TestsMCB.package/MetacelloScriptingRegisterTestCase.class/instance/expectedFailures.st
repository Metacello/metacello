tests
expectedFailures
  ^ (MetacelloPlatform current defaultPlatformAttributes
    includes: #'squeak4.5.x')
    ifTrue: [ 
      "see https://github.com/dalehenrich/metacello-work/issues/303"
      #(#'testBaselineRegister') ]
    ifFalse: [ #() ]