private
downloadJSONTags
  | tagsUrl jsonObject |
  tagsUrl := self projectTagsUrlFor: self projectPath.
  jsonObject := MetacelloPlatform current downloadJSON: tagsUrl.
  ^ self normalizeTagsData: jsonObject