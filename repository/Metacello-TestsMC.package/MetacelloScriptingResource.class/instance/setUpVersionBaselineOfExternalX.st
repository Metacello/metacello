baseline:with:
setUpVersionBaselineOfExternalX
    "self reset"

    | versionInfo |
    versionInfo := self setUpVersionBaselineOfExternalXdkh1.
    versionInfo := self setUpVersionBaselineOfExternalXdkh2: {versionInfo}