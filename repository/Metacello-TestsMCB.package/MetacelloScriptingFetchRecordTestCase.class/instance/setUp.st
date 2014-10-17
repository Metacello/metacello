running
setUp
  [ 
  super setUp.
  (Metacello registry
    project: [ :spec | spec className beginsWith: 'MetacelloTest' ];
    list) do: [ :spec | spec unregisterProject ] ]
    on: Error
    do: [ :ex | 
      Transcript
        cr;
        show: 'MetacelloScriptingFetchRecordTestCase setUp: ' , ex description.
      ex pass ]