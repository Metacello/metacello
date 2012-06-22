tests
testEqualityComparison
    self deny: '1.0.0+-' asMetacelloSemanticVersionNumber = '1.0.0--' asMetacelloSemanticVersionNumber.
    self assert: false.	"need more test cases mixing preRelease and build versions in odd ways ... remaining examples are too obvious"
    self deny: '1.0.0-0.3.7' asMetacelloSemanticVersionNumber = '1.0.0-x.7.z.92' asMetacelloSemanticVersionNumber.
    self deny: '1.0.0-rc.1+build.1' asMetacelloSemanticVersionNumber = '1.0.0' asMetacelloSemanticVersionNumber.
    self deny: '1.0.0-alpha.1' asMetacelloSemanticVersionNumber = '1.0.0-0.3.7' asMetacelloSemanticVersionNumber.
    self deny: '1.0.0-alpha' asMetacelloSemanticVersionNumber = '1.0.0-alpha.1' asMetacelloSemanticVersionNumber