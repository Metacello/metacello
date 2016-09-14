accessing
projectWith: projectAttributes
  | project |
  "Construct Metacello project"
  project := self projectClass new.
  project projectAttributes: projectAttributes.
  project class versionConstructorClass on: self project: project.
  project loader: MetacelloNullRecordingMCSpecLoader new.
  ^ project