scripting
asProjectSpecForVersion: vrsn
  "I'm a reference spec and my project comes from the project I'm loaded from, not the project I am loading"

  "https://github.com/dalehenrich/metacello-work/issues/331"

  | proj spec |
  proj := vrsn versionSpec project.
  spec := proj configurationOfProjectSpecClass for: proj.
  self copyForScriptingInto: spec.
  self assert: (self className beginsWith: 'BaselineOf') not.
  ^ spec