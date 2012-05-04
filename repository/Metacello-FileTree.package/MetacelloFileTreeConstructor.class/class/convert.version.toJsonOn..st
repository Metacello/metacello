private
convert: project version: inputVersionStringOrSymbol toJsonOn: aStream
    | sourceVersionString |
    sourceVersionString := (project version: inputVersionStringOrSymbol) versionString.	"resolve symbolic version"
    (MetacelloToolBoxConstructor new
        configuration: project configuration class new;
        extractMethodSectionsFor: sourceVersionString;
        yourself) jsonOn: aStream