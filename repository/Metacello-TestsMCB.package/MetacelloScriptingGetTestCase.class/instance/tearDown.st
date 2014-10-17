running
tearDown
  [ super tearDown ]
    on: Error
    do: [ :ex | 
      Transcript
        cr;
        show: 'MetacelloScriptingGetTestCase tearDown: ' , ex description.
      ex pass ]