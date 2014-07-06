*metacello-gemstone-testsmcb
doSilently
  ^ (#(#'testLoadConfigurationThenBaselineThenUnload' #'testLoadConfigurationThenUnload')
    includes: testSelector asSymbol) not