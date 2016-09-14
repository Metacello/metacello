accessing
projectWith: projectAttributes
  | project |
  "Construct Metacello project"
  project := MetacelloMCProject new.
  project projectAttributes: projectAttributes.
  project class versionConstructorClass on: self project: project.
  project loader: MetacelloNullRecordingMCSpecLoader new.
  ^ project