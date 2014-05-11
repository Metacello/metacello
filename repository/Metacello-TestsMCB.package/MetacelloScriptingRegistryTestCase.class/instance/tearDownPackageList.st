running
tearDownPackageList
  ^ super tearDownPackageList
    , #('ConfigurationOfExternal' 'BaselineOfExternal' 'External-Core')