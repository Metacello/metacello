issue 261
testConfigurationConflictIssue261
  "https://github.com/dalehenrich/metacello-work/issues/261 ... load without error"

  | disallowed |
  self testFileTreeLoadIssue261.
  Metacello new
    configuration: 'Conflict';
    version: '1.0.0';
    repository: 'filetree://' , configurationDirectory fullName;
    silently;
    onConflict: [ :ex | ex useLoaded ];
    load