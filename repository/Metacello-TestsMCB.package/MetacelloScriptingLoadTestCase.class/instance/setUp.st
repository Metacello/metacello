running
setUp
  [ super setUp ]
    on: Error
    do: [ :ex | 
      Transcript
        cr;
        show: 'MetacelloScriptingLoadTestCase setup: ' , ex description.
      ex pass ]