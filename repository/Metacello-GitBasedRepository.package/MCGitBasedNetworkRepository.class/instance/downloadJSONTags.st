private
downloadJSONTags
  | tagsUrl jsonObject |
  tagsUrl := self projectTagsUrlFor: self projectPath.
  jsonObject := MetacelloPlatform current
    downloadJSON: tagsUrl
    username: nil
    pass: nil.
  ^ self normalizeTagsData: jsonObject