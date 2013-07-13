tests
testBasicRegistration
    | registration projectSpec |
    projectSpec := self configurationProjectSpec.
    registration := projectSpec asProjectRegistration.
    registration baselineProjectSpec: self baselineProjectSpec.
    self assert: registration isValid.
    self assert: registration = registration.
    self assert: registration hash = registration hash