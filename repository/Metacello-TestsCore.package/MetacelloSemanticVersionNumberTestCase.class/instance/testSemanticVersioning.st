tests
testSemanticVersioning
    self validateSemanticVersionStrings: #('1.0.0-alpha' '1.0.0-1').
    self validateSemanticVersionStrings: #('1.0.0+alpha' '1.0.0-1').
    self validateSemanticVersionStrings: #('1.0.0-alpha' '1.0.0+1').
    self validateSemanticVersionStrings: #('1.0.0+alpha' '1.0.0+1').
    self validateSemanticVersionStrings: #('1.0.0--' '1.0.0-a').
    self validateSemanticVersionStrings: #('1.0.0+-' '1.0.0+a').
    self validateSemanticVersionStrings: #('1.0.0-rc.1' '1.0.0' '1.0.0+build.1').
    self validateSemanticVersionStrings: #('1.0.0-rc.1+build.1' '1.0.0-rc.1+build.2' '1.0.0-rc.2+build.3').
    self validateSemanticVersionStrings: #('1.0.0-rc.1' '1.0.0-rc.1+build.2' '1.0.0-rc.2').
    self validateSemanticVersionStrings: #('1.0.0-rc.1+build.1' '1.0.0-rc.1+build.2' '1.0.0-rc.2')	"self validateSemanticVersionStrings: #('1.0.0-rc.1+build.1' '1.0.0-rc.1+build.2' '1.0.0-rc.2+build.2')"