initialize-release
initialize
  "self initialize"

  self select.
  SystemLoginNotification subscribe: self name.
  self sessionStart