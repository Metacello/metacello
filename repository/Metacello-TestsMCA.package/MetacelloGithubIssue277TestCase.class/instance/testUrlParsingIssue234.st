tests
testUrlParsingIssue234
  "https://github.com/dalehenrich/metacello-work/issues/234"

  {{'github://dalehenrich/external:issue\/234/repository'.
  'github://dalehenrich/external:issue\/234/repository'.
  'dalehenrich/external'.
  'issue/234'.
  'repository'}.
  {'github://dalehenrich/external:issue\/xxx\/branch/repository'.
  'github://dalehenrich/external:issue\/xxx\/branch/repository'.
  'dalehenrich/external'.
  'issue/xxx/branch'.
  'repository'}} do: [ :spec | self validate: spec ]