accessing
projectWith: projectAttributes
  | project |
  "Construct Metacello project"
  project := MetacelloProject new.
  project projectAttributes: projectAttributes.
  project class versionConstructorClass on: self project: project.
  ^ project