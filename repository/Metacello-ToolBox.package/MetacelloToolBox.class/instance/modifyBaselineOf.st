api-configuration
modifyBaselineOf
  | baselineClass constructor pragma baseline |
  baselineClass := project configuration class.
  baseline := baselineClass new.
  constructor := MetacelloToolBoxBaselineConstructor new
    configuration: project configuration class new;
    yourself.
  pragma := constructor extractBaselinePragmaFor: baselineClass.
  constructor extractMethodSectionsForClass: baselineClass.
  methodSpec := MetacelloBaselineOfMethodSpec new
    project: project;
    selector: pragma selector;
    category: (baselineClass whichCategoryIncludesSelector: pragma selector);
    yourself.
  constructor methodSections
    do: [ :methodSection | self methodSpec methodSections add: methodSection ]