running
tearDown
  [ super tearDown ]
    on: Error
    do: [ :ex | 
      Transcript
        cr;
        show: 'MetacelloScriptingLoadTestCase teardown: ' , ex description.
      ex pass ]