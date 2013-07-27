doits
reprimeRegistryIssue197
  MetacelloProjectRegistration registry baselineRegistry values
    detect: [ :registration | registration isValid not ]
    ifAbsent: [ 
      "no invalid registrations, don't reset and prime"
      ^ self ].
  Transcript
    cr;
    show:
        'priming registry from image. See https://github.com/dalehenrich/metacello-work/issues/197'.
  MetacelloProjectRegistration
    resetRegistry;
    primeRegistryFromImage