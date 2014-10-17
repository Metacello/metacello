running
setUp
  [ super setUp ]
    on: Error
    do: [ :ex | 
      Transcript
        cr;
        show: 'MetacelloScriptingGetTestCase setUp: ' , ex description.
      ex pass ]