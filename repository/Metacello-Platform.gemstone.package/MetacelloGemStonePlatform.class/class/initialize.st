initialize-release
initialize
  self select.
  SystemLoginNotification subscribe: self name.
  self sessionStart