running
tearDown
  [ 
  super tearDown.
  (Metacello registry
    project: [ :spec | spec className beginsWith: 'MetacelloTest' ];
    list) do: [ :spec | spec unregisterProject ] ]
    on: Error
    do: [ :ex | 
      Transcript
        cr;
        show: 'MetacelloScriptingFetchRecordTestCase tearDown ' , ex description.
      ex pass ]