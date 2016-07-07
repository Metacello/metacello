running
tearDownPackageList
  "2.4.8 leaks an external package: https://travis-ci.org/dalehenrich/metacello-work/jobs/142955102#L5305"

  ^ super tearDownPackageList , #('External')