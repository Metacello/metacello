utility
jsonOn: aStream for: versionSpecBlock
    | versionString project |
    versionString := 'metacello'.
    (self new extractMethodSectionsFor: versionString specBlock: versionSpecBlock)
        jsonOn: aStream