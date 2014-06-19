*metacello-testsplatform
doSilently
  ^ (#(#'testLoadConfigurationThenBaselineThenUnload' #'testLoadConfigurationThenUnload')
    includes: testSelector asSymbol) not