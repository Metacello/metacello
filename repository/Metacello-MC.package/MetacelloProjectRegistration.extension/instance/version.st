*metacello-mc
version
    ^ (self configurationProjectSpecIfAbsent: [ ^ MetacelloMCBaselineProject singletonVersionName ]) versionString